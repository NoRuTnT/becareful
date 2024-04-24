import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class logo_widget extends StatelessWidget {
  const logo_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "조",
          style: TextStyle(
            color: red,
            fontSize: 80,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "심",
          style: TextStyle(
            color: yellow,
            fontSize: 80,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "횡",
          style: TextStyle(
            color: green,
            fontSize: 80,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
