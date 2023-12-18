import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsButton({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const VerticalDivider(
              color: Colors.white,
              width: 1,
              thickness: 1,
              indent: 8,
              endIndent: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
