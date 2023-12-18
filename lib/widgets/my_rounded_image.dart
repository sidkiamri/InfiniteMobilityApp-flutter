import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;

  RoundedImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Image.network(
        imageUrl,
        width: 190,
        height: 190,
        fit: BoxFit.cover,
      ),
    );
  }
}
