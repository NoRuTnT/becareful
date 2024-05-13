import 'package:becarefulcrosswalk/screens/main_screen.dart';
import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class ReportCompleteScreen extends StatefulWidget {
  const ReportCompleteScreen({super.key});

  @override
  State<ReportCompleteScreen> createState() => _ReportCompleteScreenState();
}

class _ReportCompleteScreenState extends State<ReportCompleteScreen> {
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
          leading: Container(),
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
                Semantics(
                  label: '신고가 정상적으로 접수되었습니다',
                  child: EasyRichText(
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
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  text: "홈으로",
                  backgroundColor: white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
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
