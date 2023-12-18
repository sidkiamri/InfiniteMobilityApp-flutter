import 'package:flutter/material.dart';

class CustomProfileRow extends StatelessWidget {
  final String iconName;
  final String text;

  CustomProfileRow({required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              _getIconData(iconName),
              size: 18,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'email':
        return Icons.email;
      case 'phone':
        return Icons.phone;
      case 'location':
        return Icons.location_on;
      // Add more cases for other icon names you may want to support.
      default:
        return Icons
            .error; // Default to an error icon if the iconName is not recognized.
    }
  }
}
