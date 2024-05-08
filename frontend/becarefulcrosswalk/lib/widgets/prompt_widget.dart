import 'package:flutter/material.dart';

class PromptWidget extends StatelessWidget {
  final String message;

  const PromptWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      color: Colors.blue.withOpacity(0.9),
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
