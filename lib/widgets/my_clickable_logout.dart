import 'package:flutter/material.dart';

class CustomLogoutSettings extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  CustomLogoutSettings({required this.text, required this.onPressed});

  @override
  _CustomSettingsState createState() => _CustomSettingsState();
}

class _CustomSettingsState extends State<CustomLogoutSettings> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward().then((value) {
          _animationController.reverse();
          widget.onPressed();
        });
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.transparent, // Set the background color to transparent
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffff6161), // Set the text color to the desired color
                    ),
                  ),
                  const Icon(Icons.logout,
                  color: Color(0xffff6161)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
