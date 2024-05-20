import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class ReportSuccessScreen extends StatefulWidget {
  const ReportSuccessScreen({super.key});

  @override
  State<ReportSuccessScreen> createState() => _ReportCompleteScreenState();
}

class _ReportCompleteScreenState extends State<ReportSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: black,
          title: const Text(
            "불편신고",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/checked.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                EasyRichText(
                  '신고가 정상적으로\n접수되었습니다',
                  textAlign: TextAlign.center,
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '접수',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                  defaultStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  text: "홈으로",
                  backgroundColor: white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
