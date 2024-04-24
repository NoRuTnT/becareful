import 'package:flutter/material.dart';

class ServiceBoxWidget extends StatelessWidget {
  const ServiceBoxWidget({
    super.key,
    required this.color,
    required this.serviceName,
  });

  final String color;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    final Color displayColor = Color(int.parse('0xFF' + color));

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 150,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: Colors.black, width: 2.0),
          bottom: BorderSide(color: Colors.black, width: 2.0),
        ),
        color: displayColor,
      ),
      child: Text(
        textAlign: TextAlign.center,
        '$serviceName',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          letterSpacing: 8.0, // 글자 사이 간격
        ),
      ),
    );
  }
}
