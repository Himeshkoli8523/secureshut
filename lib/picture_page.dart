import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:secureshut/imageview_page.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<AssetEntity> assets = [];

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  Future<void> _fetchAssets() async {
    assets = (await PhotoManager.getAssetListRange(
      start: 0,
      end: 100,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captures'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: assets.length,
        itemBuilder: (_, index) {
          return AssetThumbnail(asset: assets[index]);
        },
      ),
    );
  }
}

// assest thumbnail class to display the images
class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({super.key, required this.asset});
  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailData.then((value) => value!),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return const CircularProgressIndicator();
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageView(imageFile: asset.file),
              ),
            );
          },
          child: Image.memory(bytes, fit: BoxFit.cover),
        );
      },
    );
  }
}
