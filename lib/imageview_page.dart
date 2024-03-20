import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.imageFile,
    Key? key1,
  });
  final Future<File?> imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: FutureBuilder<File>(
        future: imageFile.then((value) => value!),
        builder: (_, snapshot) {
          final file = snapshot.data;
          if (file == null) return Container();
          return PhotoView(
            imageProvider: FileImage(file),
          );
        },
      ),
    );
  }
}
