import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vibration/vibration.dart';

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

  void _onGuidePressed(BuildContext context) async {
    if (index == 3) {
      final player = AudioPlayer();
      await player.play(AssetSource('sounds/half-pass.mp3'));
    } else if (index == 4) {
      Vibration.vibrate(pattern: [100, 400, 100, 400]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onGuidePressed(),
      child: Focus(
        focusNode: _focusNode,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: colorMap[widget.index],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colorMap[widget.index + 5] ?? Colors.black,
                  width: 1,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Semantics(
                  sortKey: const OrdinalSortKey(1),
                  label: widget.guide,
                  child: Text(
                    widget.guide,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
