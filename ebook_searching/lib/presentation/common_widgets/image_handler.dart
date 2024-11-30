import 'dart:convert';
import 'package:flutter/material.dart';

class ImageHandler extends StatelessWidget {
  final String imageUrl;
  final String defaultImage;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageHandler({super.key, required this.imageUrl, required this.defaultImage, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false) {
      // Check if it's a network link
      return Image.network(imageUrl, width: width, height:height, fit: fit,errorBuilder: (context, error, stackTrace) {
        return Image.asset(defaultImage, width: width, height: height, fit: fit,);
      });
    } else {
      try {
        // Check if it's a base64 string
        final decodedBytes = base64Decode(imageUrl);
        return Image.memory(decodedBytes, errorBuilder: (context, error, stackTrace) {
          return Image.asset(defaultImage, width: width, height: height, fit: fit,);
        });
      } catch (e) {
        // Check if it's an asset
        return Image.asset(imageUrl, width: width, height: height, fit: fit, errorBuilder: (context, error, stackTrace) {
          return Image.asset(defaultImage, width: width, height: height, fit: fit,);
        });
      }
    }
  }
}