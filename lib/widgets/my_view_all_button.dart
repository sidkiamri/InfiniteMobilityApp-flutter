import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color textColor;

  ViewAllButton(
      {required this.title, required this.onTap, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              width: 5), // Adjust the spacing between the title and the arrow
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
