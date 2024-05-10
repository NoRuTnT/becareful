import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "조심횡",
      child: const Row(
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
      ),
    );
  }
}