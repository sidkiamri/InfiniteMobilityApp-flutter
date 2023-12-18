import 'package:flutter/material.dart';

class MyImageButton extends StatelessWidget {
  final Color color;
  final String text;
  final ImageProvider image;
  final VoidCallback onTap;

  const MyImageButton({
    super.key,
    required this.color,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 172,
        height: 172,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color and opacity
              offset: Offset(0, 4), // Offset of the shadow
              blurRadius: 6, // Spread of the shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Image(
              image: image,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
