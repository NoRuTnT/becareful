import 'package:becarefulcrosswalk/screens/report/report_fail_screen.dart';
import 'package:becarefulcrosswalk/screens/report/report_voice_screen.dart';
import 'package:becarefulcrosswalk/service/my_location.dart';
import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/report_data.dart';
import '../../widgets/alert_dialog_widget.dart';

class ReportLocationScreen extends StatefulWidget {
  const ReportLocationScreen({super.key});

  @override
  State<ReportLocationScreen> createState() => _ReportLocationScreenState();
}

class _ReportLocationScreenState extends State<ReportLocationScreen> {
  String? _roadAddress;

  @override
  void initState() {
    super.initState();
    _retrieveRoadAddress();
  }

  Future<void> _retrieveRoadAddress() async {
    try {
      final address = await MyLocation().getRoadAddress();

      setState(() {
        _roadAddress = address;
        if (_roadAddress != null) {
          Provider.of<ReportData>(context, listen: false)
              .setRoadAddress(_roadAddress!);
        }
      });

      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ReportVoiceScreen(),
        ),
      );
    } catch (e) {
      print('Error getting road address: $e');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const ReportFailScreen(errorMessage: '위치 정보 조회 중\n오류가 발생했습니다'),
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
        title: const Text(
          "불편신고(2/3)",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialogWidget();
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Center(
          child: _roadAddress == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 20,
                    ),
                    EasyRichText(
                      '현재 위치를 조회 중입니다\n잠시만 기다려주세요',
                      textAlign: TextAlign.center,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: '조회 중',
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
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/checked.png',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    EasyRichText(
                      '현재 위치 조회 완료',
                      textAlign: TextAlign.center,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: '조회 완료',
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
                    Text(
                      _roadAddress!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: navy,
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
