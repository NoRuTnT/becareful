import 'package:becarefulcrosswalk/provider/report_data.dart';
import 'package:becarefulcrosswalk/screens/report/report_complete_screen.dart';
import 'package:becarefulcrosswalk/screens/report/report_stt_result_screen.dart';
import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ReportVoiceScreen extends StatefulWidget {
  const ReportVoiceScreen({super.key});

  @override
  State<ReportVoiceScreen> createState() => _ReportVoiceScreenState();
}

class _ReportVoiceScreenState extends State<ReportVoiceScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
  }

  void _startListening() async {
    print("시작");
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        localeId: 'ko_KR',
        onResult: (val) => setState(
          () {
            _text = val.recognizedWords;
            print("인식된 텍스트: $_text");
          },
        ),
        listenFor: const Duration(seconds: 30),
      );
    } else {
      print("음성 인식을 시작할 수 없습니다.");
    }
  }

  void _stopListening() {
    print("끝");
    if (_isListening) {
      setState(() => _isListening = false);
      _speech.stop();
      print("최종 인식된 텍스트: $_text");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ReportSttResultScreen(text: _text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Semantics(
                label: '말하기 버튼을 누른 상태에서 불편사항을 말씀해주세요 없다면, 바로 신고하기 버튼을 눌러주세요',
                child: EasyRichText(
                  '말하기 버튼을 누른 상태에서\n불편사항을 말씀해주세요.\n없다면, 바로 신고하기 버튼을\n눌러주세요.',
                  textAlign: TextAlign.center,
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '누른 상태',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    EasyRichTextPattern(
                      targetString: '불편사항',
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
              flex: 3,
              child: GestureDetector(
                onLongPress: _startListening,
                onLongPressUp: _stopListening,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: lightBlue,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Semantics(
                    button: true,
                    label: _isListening ? '손 떼고 제출하기' : '꾹 누른채 말하기',
                    child: Center(
                      child: Text(
                        _isListening ? '손 떼고 제출하기' : '꾹 누른채 말하기',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: ButtonWidget(
                text: "신고하기",
                backgroundColor: lightRed,
                onPressed: () async {
                  Provider.of<ReportData>(context, listen: false)
                      .setReportText(_text);
                  await Provider.of<ReportData>(context, listen: false)
                      .sendReportToServer();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportCompleteScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
