import 'dart:io';

import 'package:flutter/material.dart';

import '../styles.dart';

class GPhotoView extends StatelessWidget {
  final File? file;
  const GPhotoView({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: kColorAndroidGreen),
        // color: Colors.blueGrey,
      ),
      child: (file == null)
          ? _buildEmptyView()
          : ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.file(file!, fit: BoxFit.cover),
            ),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
        child: Text(
      'Please Pick an\n image',
      textAlign: TextAlign.center,
      style: kAnalyzingTextStyle,
    ));
  }
}
