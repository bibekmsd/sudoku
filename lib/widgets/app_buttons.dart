// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  //Add all the items needed in a button
  final Color txtColor;
  final Color bgColor;
  // final Color boderColor;
  final String text;
  IconData? icon;
  double sizeHeight;
  double sizeWidth;
  double fontSize;
  // double boderWidth;
  AppButtons({
    super.key,
    required this.txtColor,
    required this.bgColor,
    // required this.boderColor,
    required this.text,
    this.icon,
    required this.sizeWidth,
    required this.sizeHeight,
    required this.fontSize,
    // required this.boderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: sizeWidth,
        height: sizeHeight,
        child: Center(
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: txtColor,
                  fontSize: fontSize,
                ),
              ),
              const SizedBox(width: 10, height: 10),
              Icon(icon),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
