import 'package:becarefulcrosswalk/provider/report_data.dart';
import 'package:becarefulcrosswalk/screens/report/report_complete_screen.dart';
import 'package:becarefulcrosswalk/screens/report/report_voice_screen.dart';
import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportSttResultScreen extends StatelessWidget {
  final String text;

  const ReportSttResultScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const content = "역삼역 횡단보도로 가는 길에 있는 점자블록이 파손되어있어서 넘어질 뻔 했어요. 빠른수리 부탁드립니다.";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: black,
        title: Semantics(
          label: '불편신고 마지막 단계',
          child: const Text(
            "불편신고(3/3)",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Semantics(
                label: '말씀하신 내용이 맞다면 신고하기 버튼을 눌러주세요',
                child: EasyRichText(
                  '말씀하신 내용이 맞다면\n신고하기 버튼을 눌러주세요',
                  textAlign: TextAlign.center,
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '신고하기',
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
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Colors.grey[100],
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Semantics(
                    label: text,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    text: "다시 말하기",
                    backgroundColor: lightBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportVoiceScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    text: "신고하기",
                    backgroundColor: lightRed,
                    onPressed: () async {
                      Provider.of<ReportData>(context, listen: false)
                          .setReportText(text);
                      await Provider.of<ReportData>(context, listen: false)
                          .sendReportToServer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportCompleteScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
