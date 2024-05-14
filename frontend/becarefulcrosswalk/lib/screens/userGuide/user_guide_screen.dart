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
              GuideWidget(guide: '주변 60미터 이내에 보행자 신호가 있다면 안내가 나와요.', index: 0),
              GuideWidget(guide: '건너고자 하는 횡단보도 앞에 서주세요.', index: 1),
              GuideWidget(guide: '안내 시작 버튼을 누르면 신호정보가 나와요.', index: 2),
              GuideWidget(guide: '횡단보도를 50%, 100% 건널때 효과음이 들려요.', index: 3),
              GuideWidget(guide: '횡단보도를 벗어나는 방향이면 진동이 울려요.', index: 4),
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
