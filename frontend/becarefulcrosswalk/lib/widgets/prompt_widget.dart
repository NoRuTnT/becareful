import 'package:flutter/material.dart';

class PromptWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;

  const PromptWidget({
    super.key,
    required this.message,
    this.backgroundColor = const Color(0xFF48A3F7),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      color: backgroundColor,
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
