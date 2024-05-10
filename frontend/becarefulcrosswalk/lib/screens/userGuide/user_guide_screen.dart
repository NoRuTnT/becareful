import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/guide_widget.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class UserGuideScreen extends StatelessWidget {
  const UserGuideScreen({super.key});

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
        title: Semantics(
          label: '이용방법',
          child: const Text(
            '이용방법',
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Semantics(
                  label: '보행자 신호등의 실시간 신호정보 받는 방법',
                  child: EasyRichText(
                    textAlign: TextAlign.center,
                    '보행자 신호등의\n실시간 신호정보 받는 방법',
                    defaultStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    patternList: [
                      EasyRichTextPattern(
                        targetString: '실시간 신호정보',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GuideWidget(guide: '주변 50미터 이내에 신호등이 있다면 알림을 보내드려요', index: 0),
              GuideWidget(guide: '건너고자 하는 횡단보도 앞에 서주세요.', index: 1),
              GuideWidget(guide: '핸드폰 방향과 횡단보도 방향이 일치하면 진동이 울려요.', index: 2),
              GuideWidget(guide: '핸드폰 방향과 횡단보도 방향이 일치하면 진동이 울려요.', index: 3),
              GuideWidget(
                  guide: '횡단보도 중간 지점에 도달하면 1차 효과음이 울리고 완전히 건너면 2차 효과음이 울립니다.',
                  index: 4),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/userGuide2');
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
                    child: Semantics(
                      button: true,
                      label: '다음',
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          '다음',
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
