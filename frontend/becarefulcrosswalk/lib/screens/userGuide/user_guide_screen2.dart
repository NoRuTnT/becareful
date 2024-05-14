import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/guide_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

import '../main_screen.dart';

class UserGuideScreen2 extends StatelessWidget {
  const UserGuideScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          '이용방법',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: EasyRichText(
                  textAlign: TextAlign.center,
                  '시각장애인 편의시설\n불편사항 신고 방법',
                  defaultStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '불편',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    EasyRichTextPattern(
                      targetString: '신고',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              GuideWidget(guide: '불편사항이 있는 장소를 촬영해주세요.', index: 0),
              GuideWidget(guide: '말하기 버튼을 누른 상태로 불편사항을 설명해주세요.', index: 1),
              GuideWidget(guide: '점자블록, 음향신호기 등을 자유롭게 말씀하세요.', index: 2),
              GuideWidget(guide: '말씀하신 내용이 맞다면 신고하기 버튼을 눌러주세요.', index: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: black,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        '홈으로',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
