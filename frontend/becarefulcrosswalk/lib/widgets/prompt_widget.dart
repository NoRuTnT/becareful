import 'package:flutter/material.dart';

class PromptWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;

  const PromptWidget({
    super.key,
    required this.message,
    this.backgroundColor = const Color(0xFF48A3F7),
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      color: backgroundColor,
      child: Text(
        message,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
          fontWeight: fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
