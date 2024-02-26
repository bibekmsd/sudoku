import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color txtColor;
  final Color bgColor;
  final String text;
  final IconData? icon;
  final double sizeHeight;
  final double sizeWidth;
  final double fontSize;
  final VoidCallback onPressedCallback;

  AppButtons({
    Key? key,
    required this.txtColor,
    required this.bgColor,
    required this.text,
    this.icon,
    required this.sizeWidth,
    required this.sizeHeight,
    required this.fontSize,
    required this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center text and icon
          children: [
            Text(
              text,
              style: TextStyle(
                color: txtColor,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 10), // Adjust the spacing between text and icon
            if (icon != null) Icon(icon),
          ],
        ),
      ),
    );
  }
}
