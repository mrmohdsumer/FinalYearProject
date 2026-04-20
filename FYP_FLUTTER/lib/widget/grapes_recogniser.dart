import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import '../classifier/classifier.dart';
// import '../classifier/classifieroutDated.dart';
import '../styles.dart';
import 'grapes_photo_view.dart';

/// Paths must match entries under `flutter: assets:` in pubspec.yaml.
const _labelsFileName = 'assets/model/labels.txt';
const _modelFileName = 'assets/model/my_modelforexternalftr.tflite';

class GrapesRecogniser extends StatefulWidget {
  const GrapesRecogniser({Key? key}) : super(key: key);

  @override
  State<GrapesRecogniser> createState() => _GrapesRecogniserState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _GrapesRecogniserState extends State<GrapesRecogniser> {
  bool _isAnalyzing = false;
  final picker = ImagePicker();
  File? _selectedImageFile;

  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _grapesLabel = ''; // Name of Error Message
  double _accuracy = 0.0;

  Classifier? _classifier;
  bool _classifierLoadFinished = false;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    try {
      final classifier = await Classifier.loadWith(
        labelsFileName: _labelsFileName,
        modelFileName: _modelFileName,
      );
      if (!mounted) return;
      setState(() {
        _classifier = classifier;
        _classifierLoadFinished = true;
      });
    } catch (e, st) {
      debugPrint('Error loading classifier: $e');
      debugPrint('$st');
      if (!mounted) return;
      setState(() {
        _classifier = null;
        _classifierLoadFinished = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load model: $e'),
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30),
            _buildPhotolView(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildResultView(),
            ),
            const Spacer(flex: 5),
            _buildPickPhotoButton(
              title: 'Capture Image',
              source: ImageSource.camera,
            ),
            _buildPickPhotoButton(
              title: 'Select from gallery',
              source: ImageSource.gallery,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotolView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        GPhotoView(file: _selectedImageFile),
        _buildAnalyzingText(),
      ],
    );
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return const Text('Analyzing...', style: kAnalyzingTextStyle);
  }

  Widget _buildTitle() {
    return const Text(
      'Grapes Recogniser',
      style: kTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPickPhotoButton({
    required ImageSource source,
    required String title,
  }) {
    return TextButton(
      onPressed: () => _onPickPhoto(source),
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: kColorAndroidGreen, borderRadius: BorderRadius.circular(13)),
        child: ListTile(
          leading: Icon(
            title == "Capture Image" ? Icons.camera_alt : Icons.image,
            color: Colors.green,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.green,
            size: 20,
          ),
        ),
      ),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    if (!_classifierLoadFinished) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Model still loading...')),
      );
      return;
    }
    if (_classifier == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Model is not available. Check the message above or restart the app.',
          ),
        ),
      );
      return;
    }

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {
      _selectedImageFile = imageFile;
    });

    _analyzeImage(imageFile);
  }

  void _analyzeImage(File image) {
    try{

    _setAnalyzing(true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: kColorAndroidGreen,
      showCloseIcon: true,
      content: Text(
        'Analysing Image...'.toUpperCase(),
        style: const TextStyle(color: Colors.green),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.25,
          right: 30,
          left: 30),
      duration: const Duration(milliseconds: 400),
      behavior: SnackBarBehavior.floating,
    ));

    final imageInput = img.decodeImage(image.readAsBytesSync());
    if (imageInput == null) {
      throw Exception('Image decode failed');
    }


    final resultCategory = _classifier!.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _grapesLabel = plantLabel;
      _accuracy = accuracy;
    });
    }
    catch (e) {
    _setAnalyzing(false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")),
    );
  }
  }

  Widget _buildResultView() {
    var title = '-';

    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Fail to recognise';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _grapesLabel;
    } else {
      title = '-';
    }

    //
    var accuracyLabel = '-';
    if (_resultStatus == _ResultStatus.found) {
      accuracyLabel =
          '${((_accuracy > 0.99 ? _accuracy - 0.005 : _accuracy) * 100).toStringAsFixed(2)}%';
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          decoration: BoxDecoration(
              color: kColorAndroidGreen,
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Result:", style: kResultTextStyle),
              Text(title.toUpperCase(), style: kResultTextStyle),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          decoration: BoxDecoration(
              color: kColorAndroidGreen,
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Accuracy:", style: kResultTextStyle),
              Text(accuracyLabel.toUpperCase(), style: kResultTextStyle),
            ],
          ),
        ),
        // const SizedBox(height: 10),
        // Text(accuracyLabel, style: kResultRatingTextStyle)
      ],
    );
  }
}
