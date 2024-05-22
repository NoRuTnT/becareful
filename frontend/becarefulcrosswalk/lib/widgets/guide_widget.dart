import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vibration/vibration.dart';

import '../theme/colors.dart';

class GuideWidget extends StatefulWidget {
  const GuideWidget({
    Key? key,
    required this.guide,
    required this.index,
    required this.screenIndex,
  }) : super(key: key);

  final String guide;
  final int index;
  final int screenIndex;

  @override
  _GuideWidgetState createState() => _GuideWidgetState();
}

class _GuideWidgetState extends State<GuideWidget> {
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

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      _onGuidePressed();
    }
  }

  void _onGuidePressed() async {
    if (widget.screenIndex == 1 && widget.index == 3) {
      final player = AudioPlayer();
      await player.play(AssetSource('sounds/half-pass.mp3'));
    } else if (widget.screenIndex == 1 && widget.index == 4) {
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
            Positioned(
              top: -15,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: colorMap[widget.index + 5] ?? Colors.black,
                      width: 2.5),
                  color: colorMap[widget.index],
                ),
                child: Center(
                  child: Semantics(
                    sortKey: const OrdinalSortKey(0),
                    label: '${widget.index + 1}단계',
                    child: Text(
                      '${widget.index + 1}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: colorMap[widget.index + 5] ?? Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
