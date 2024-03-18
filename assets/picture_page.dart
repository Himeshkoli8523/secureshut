import 'dart:io';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageViewPage(),
    );
  }
}

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({Key? key}) : super(key: key);

  final List<String> imagePaths = [
    'path_to_your_first_image.jpg',
    'path_to_your_second_image.jpg',
    // Add more paths to your images here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageView Page'),
      ),
      body: PageView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, pagePosition) {
          // Assuming images are stored locally
          return Container(
            margin: const EdgeInsets.all(10),
            child: Image.file(
              File(imagePaths[pagePosition]),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
