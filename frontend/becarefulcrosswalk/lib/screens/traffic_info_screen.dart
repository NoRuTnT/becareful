import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:flutter/material.dart';

class TrafficInfoScreen extends StatelessWidget {
  const TrafficInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const direction = "역삼역 1번 출구";
    const length = "200";
    const lightColor = "초록불";
    const remainingTime = "11";

    return Scaffold(
      backgroundColor: darkGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              direction + " 방향",
              style: TextStyle(
                color: lightGray,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              length + "미터 횡단보도",
              style: TextStyle(
                color: lightGray,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              lightColor + " " + remainingTime + "초",
              style: TextStyle(
                color: green2,
                fontSize: 55,
                fontWeight: FontWeight.w800,
              ),
            ),
            Stack(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Column(
                      children: [
                        crosswalk_box(),
                        crosswalk_box(),
                        crosswalk_box(),
                        crosswalk_box(),
                        crosswalk_box(),
                        crosswalk_box(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade100.withOpacity(0.6),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade600.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class crosswalk_box extends StatelessWidget {
  const crosswalk_box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        child: Container(
          width: 300,
          height: 30,
          color: white,
        ),
      ),
    );
  }
}
