import 'package:becarefulcrosswalk/screens/report/report_photo_screen.dart';
import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class ReportFailScreen extends StatefulWidget {
  final String errorMessage;

  const ReportFailScreen({
    super.key,
    required this.errorMessage,
  });

  @override
  State<ReportFailScreen> createState() => _ReportCompleteScreenState();
}

class _ReportCompleteScreenState extends State<ReportFailScreen> {
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
                  'images/fail.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                EasyRichText(
                  widget.errorMessage,
                  textAlign: TextAlign.center,
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '오류',
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
                  text: "다시 시도",
                  backgroundColor: white,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReportPhotoScreen(),
                      ),
                    );
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
