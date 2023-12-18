import 'package:flutter/material.dart';

class MyTextButtonOutline extends StatelessWidget {
  const MyTextButtonOutline({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.textColor,
  });
  final String buttonName;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Theme.of(context).textTheme.bodySmall!.color!,
        ),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => Colors.black12,
          ),
        ),
        onPressed: onTap,
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
