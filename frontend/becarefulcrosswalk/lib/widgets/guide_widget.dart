import 'package:flutter/material.dart';

import '../theme/colors.dart';

class GuideWidget extends StatelessWidget {
  GuideWidget({
    super.key,
    required this.guide,
    required this.index,
  });

  final Map<int, Color> colorMap = {
    0: lightRed,
    1: lightYellow,
    2: lightGreen,
    3: lightBlue,
    4: lightPurple,
    5: strokeRed,
    6: strokeYellow,
    7: strokeGreen,
    8: strokeBlue,
    9: strokePurple,
  };

  final String guide;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 30),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: colorMap[index],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorMap[index + 5] ?? Colors.black,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              guide,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          top: -15,
          left: MediaQuery.of(context).size.width / 2 - 40,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: colorMap[index + 5] ?? Colors.black, width: 2.5),
              color: colorMap[index],
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: colorMap[index + 5] ?? Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
