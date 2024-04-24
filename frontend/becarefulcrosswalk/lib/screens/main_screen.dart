import 'package:becarefulcrosswalk/widgets/service_box_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 180,
            ),
            ServiceBoxWidget(
              color: 'FFE5E0',
              serviceName: '이용방법',
            ),
            ServiceBoxWidget(
              color: 'FFF0D9',
              serviceName: '실시간\n신호정보',
            ),
            ServiceBoxWidget(
              color: 'E6EEE1',
              serviceName: '불편신고',
            ),
          ],
        ),
      ),
    );
  }
}
