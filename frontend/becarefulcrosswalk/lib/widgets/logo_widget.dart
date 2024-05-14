import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyRichText(
          textAlign: TextAlign.center,
          '조심횡',
          defaultStyle: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w600,
            letterSpacing: 20,
          ),
          patternList: [
            EasyRichTextPattern(
              targetString: '조',
              style: const TextStyle(
                color: red,
              ),
            ),
            EasyRichTextPattern(
              targetString: '심',
              style: const TextStyle(
                color: yellow,
              ),
            ),
            EasyRichTextPattern(
              targetString: '횡',
              style: const TextStyle(
                color: green,
              ),
            )
          ],
        ),
      ],
    );
  }
}
