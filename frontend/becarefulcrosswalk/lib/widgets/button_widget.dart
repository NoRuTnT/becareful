import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double height;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
    this.height = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: backgroundColor,
          side: const BorderSide(
            width: 2,
            color: Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(double.infinity, 20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
