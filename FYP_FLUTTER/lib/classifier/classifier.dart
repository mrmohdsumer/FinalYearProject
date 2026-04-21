import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

import 'classifier_category.dart';
import 'classifier_model.dart';

typedef ClassifierLabels = List<String>;

class Classifier {
  final ClassifierLabels _labels;
  final ClassifierModel _model;

  Classifier._({
    required ClassifierLabels labels,
    required ClassifierModel model,
  })  : _labels = labels,
        _model = model;

  static Future<Classifier> loadWith({
    required String labelsFileName,
    required String modelFileName,
  }) async {
    final labels = await _loadLabels(labelsFileName);
    final model = await _loadModel(modelFileName);
    final numClasses = _numClassesFromShape(model.outputShape);
    if (labels.length != numClasses) {
      throw StateError(
        'labels.txt has ${labels.length} lines but the model has $numClasses outputs. '
        'They must match, in the same order as training (e.g. Keras '
        '`train_generator.class_indices` / folder order).',
      );
    }
    return Classifier._(labels: labels, model: model);
  }

  static Future<ClassifierModel> _loadModel(String modelFileName) async {
    final interpreter = await Interpreter.fromAsset(modelFileName);

    final inputShape = interpreter.getInputTensor(0).shape;
    final outputShape = interpreter.getOutputTensor(0).shape;

    final inputType = interpreter.getInputTensor(0).type;
    final outputType = interpreter.getOutputTensor(0).type;

    return ClassifierModel(
      interpreter: interpreter,
      inputShape: inputShape,
      outputShape: outputShape,
      inputType: inputType,
      outputType: outputType,
    );
  }

  static int _numClassesFromShape(List<int> shape) {
    if (shape.length == 1) return shape[0];
    return shape[1];
  }

  static Future<ClassifierLabels> _loadLabels(String fileName) async {
    final raw = await rootBundle.loadString(fileName);
    return raw
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  }

  void close() {
    _model.interpreter.close();
  }

  ClassifierCategory predict(img.Image image) {
    final input = _preProcess(image);

    final output = List.filled(_model.outputShape.reduce((a, b) => a * b), 0.0)
        .reshape(_model.outputShape);

    _model.interpreter.run(input, output);

    final raw = _scoresFromOutput(output, _model.outputShape);
    final scores = _asProbabilities(raw);

    List<ClassifierCategory> results = [];
    for (int i = 0; i < scores.length; i++) {
      results.add(ClassifierCategory(_labels[i], scores[i]));
    }

    results.sort((a, b) => b.score.compareTo(a.score));

    return results.first;
  }

  /// Maps logits to probabilities when the exported model omits softmax.
  static List<double> _asProbabilities(List<double> values) {
    if (values.isEmpty) return values;
    final sum = values.fold<double>(0, (a, b) => a + b);
    final looksLikeSoftmax = values.every((e) => e >= 0 && e <= 1.0) &&
        sum > 0.95 &&
        sum < 1.05;
    if (looksLikeSoftmax) return values;

    final maxLogit = values.reduce(math.max);
    var expSum = 0.0;
    final exps = List<double>.generate(values.length, (i) {
      final e = math.exp(values[i] - maxLogit);
      expSum += e;
      return e;
    });
    if (expSum <= 0) return values;
    return exps.map((e) => e / expSum).toList();
  }

  static List<double> _scoresFromOutput(
    dynamic output,
    List<int> outputShape,
  ) {
    if (outputShape.length == 1) {
      final row = output as List;
      return row.map((e) => (e as num).toDouble()).toList();
    }
    final batch = output as List;
    final first = batch[0] as List;
    return first.map((e) => (e as num).toDouble()).toList();
  }

List<List<List<List<double>>>> _preProcess(img.Image image) {
  int inputSize = _model.inputShape[1];

  img.Image resized =
      img.copyResize(image, width: inputSize, height: inputSize);

  return [
    List.generate(
      inputSize,
      (y) => List.generate(
        inputSize,
        (x) {
          final pixel = resized.getPixel(x, y);
          return [
            pixel.r.toDouble() / 223.0,
            pixel.g.toDouble() / 223.0,
            pixel.b.toDouble() / 223.0,
          ];
        },
      ),
    ),
  ];
}
  // List _preProcess(img.Image image) {
  //   int inputSize = _model.inputShape[1];

  //   // Resize image
  //   img.Image resized =
  //       img.copyResize(image, width: inputSize, height: inputSize);

  //   // Normalize
  //   List<List<List<double>>> input = List.generate(
  //     1,
  //     (_) => List.generate(
  //       inputSize,
  //       (y) => List.generate(
  //         inputSize,
  //         (x) {
  //           final pixel = resized.getPixel(x, y);
  //           // return [
  //           //   (img.getRed(pixel) - 127.5) / 127.5,
  //           //   (img.getGreen(pixel) - 127.5) / 127.5,
  //           //   (img.getBlue(pixel) - 127.5) / 127.5,
  //           // ];
  //           return [
  //             (pixel.r - 127.5) / 127.5,
  //             (pixel.g - 127.5) / 127.5,
  //             (pixel.b - 127.5) / 127.5,
  //           ];
  //         },
  //       ),
  //     ),
  //   );

  //   return input;
  // }
}




// import 'dart:math';

// import 'package:flutter/foundation.dart';
// import 'package:image/image.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

// import 'classifier_category.dart';
// import 'classifier_model.dart';

// typedef ClassifierLabels = List<String>;

// class Classifier {
//   final ClassifierLabels _labels;
//   final ClassifierModel _model;

//   Classifier._({
//     required ClassifierLabels labels,
//     required ClassifierModel model,
//   })  : _labels = labels,
//         _model = model;

//   static Future<Classifier?> loadWith({
//     required String labelsFileName,
//     required String modelFileName,
//   }) async {
//     try {
//       final labels = await _loadLabels(labelsFileName);
//       final model = await _loadModel(modelFileName);
//       return Classifier._(labels: labels, model: model);
//     } catch (e) {
//       debugPrint('Can\'t initialize Classifier: ${e.toString()}');
//       if (e is Error) {
//         debugPrintStack(stackTrace: e.stackTrace);
//       }
//       return null;
//     }
//   }

//   static Future<ClassifierModel> _loadModel(String modelFileName) async {
//     final interpreter = await Interpreter.fromAsset(modelFileName);

//     // Get input and output shape from the model
//     final inputShape = interpreter.getInputTensor(0).shape;
//     final outputShape = interpreter.getOutputTensor(0).shape;

//     debugPrint('Input shape: $inputShape');
//     debugPrint('Output shape: $outputShape');

//     // Get input and output type from the model
//     final inputType = interpreter.getInputTensor(0).type;
//     final outputType = interpreter.getOutputTensor(0).type;

//     debugPrint('Input type: $inputType');
//     debugPrint('Output type: $outputType');

//     return ClassifierModel(
//       interpreter: interpreter,
//       inputShape: inputShape,
//       outputShape: outputShape,
//       inputType: inputType,
//       outputType: outputType,
//     );
//   }

//   static Future<ClassifierLabels> _loadLabels(String labelsFileName) async {
//     final rawLabels = await FileUtil.loadLabels(labelsFileName);

//     // Remove the index number from the label
//     final labels = rawLabels
//         .map((label) => label.substring(label.indexOf(' ')).trim())
//         .toList();

//     debugPrint('Labels: $labels');
//     return labels;
//   }

//   void close() {
//     _model.interpreter.close();
//   }

//   ClassifierCategory predict(Image image) {
//     debugPrint(
//       'Image: ${image.width}x${image.height}, '
//       'size: ${image.length} bytes',
//     );

//     // Load the image and convert it to TensorImage for TensorFlow Input
//     final inputImage = _preProcessInput(image);

//     debugPrint(
//       'Pre-processed image: ${inputImage.width}x${image.height}, '
//       'size: ${inputImage.buffer.lengthInBytes} bytes',
//     );

//     // Define the output buffer
//     final outputBuffer = TensorBuffer.createFixedSize(
//       _model.outputShape,
//       _model.outputType,
//     );

//     // Run inference
//     _model.interpreter.run(inputImage.buffer, outputBuffer.buffer);

//     debugPrint('OutputBuffer: ${outputBuffer.getDoubleList()}');

//     // Post Process the outputBuffer
//     final resultCategories = _postProcessOutput(outputBuffer);
//     final topResult = resultCategories.first;

//     debugPrint('Top category: $topResult');

//     return topResult;
//   }

//   List<ClassifierCategory> _postProcessOutput(TensorBuffer outputBuffer) {
//     final probabilityProcessor = TensorProcessorBuilder().build();

//     probabilityProcessor.process(outputBuffer);

//     final labelledResult = TensorLabel.fromList(_labels, outputBuffer);

//     final categoryList = <ClassifierCategory>[];
//     labelledResult.getMapWithFloatValue().forEach((key, value) {
//       final category = ClassifierCategory(key, value);
//       categoryList.add(category);
//       debugPrint('label: ${category.label}, score: ${category.score}');
//     });
//     categoryList.sort((a, b) => (b.score > a.score ? 1 : -1));

//     return categoryList;
//   }

//   TensorImage _preProcessInput(Image image) {
//     // #1
//     final inputTensor = TensorImage(_model.inputType);
//     inputTensor.loadImage(image);

//     // #2
//     final minLength = min(inputTensor.height, inputTensor.width);
//     final cropOp = ResizeWithCropOrPadOp(minLength, minLength);

//     // #3
//     final shapeLength = _model.inputShape[1];
//     final resizeOp = ResizeOp(shapeLength, shapeLength, ResizeMethod.BILINEAR);

//     // #4
//     final normalizeOp = NormalizeOp(127.5, 127.5);

//     // #5
//     final imageProcessor = ImageProcessorBuilder()
//         .add(cropOp)
//         .add(resizeOp)
//         .add(normalizeOp)
//         .build();

//     imageProcessor.process(inputTensor);

//     // #6
//     return inputTensor;
//   }
// }
