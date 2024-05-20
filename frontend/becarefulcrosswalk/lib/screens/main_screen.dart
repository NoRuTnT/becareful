import 'package:becarefulcrosswalk/widgets/service_box_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/logo_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            LogoWidget(),
            SizedBox(
              height: 50,
            ),
            ServiceBoxWidget(
              color: lightRed,
              serviceName: '이용방법',
              serviceScreen: '/userGuide',
              imageName: 'information',
            ),
            ServiceBoxWidget(
              color: lightYellow,
              serviceName: '실시간\n신호정보',
              serviceScreen: '/map',
              imageName: 'map',
            ),
            ServiceBoxWidget(
              color: lightGreen,
              serviceName: '불편신고',
              serviceScreen: '/report',
              imageName: 'report',
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
