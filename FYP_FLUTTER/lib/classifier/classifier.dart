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

    final scores = output[0] as List<double>;
    // print(scores);

    List<ClassifierCategory> results = [];
    for (int i = 0; i < scores.length; i++) {
      results.add(ClassifierCategory(_labels[i], scores[i]));
    }

    results.sort((a, b) => b.score.compareTo(a.score));

    return results.first;
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
            pixel.r / 255.0,
            pixel.g / 255.0,
            pixel.b / 255.0,
          ];
        },
      ),
    ),
  ];
}
}

