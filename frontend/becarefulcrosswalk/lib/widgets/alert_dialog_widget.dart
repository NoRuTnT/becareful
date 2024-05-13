import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: const Column(
        children: [
          Icon(
            Icons.warning_rounded,
            color: Color(0xFFB24E5A),
            size: 50,
          ),
          SizedBox(height: 10),
          Text(
            '홈으로 이동하시겠어요?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: const Text(
        '진행 사항은 저장되지 않아요',
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        // 취소 버튼
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFD2D2D2), // 회색 배경
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // 대화상자 닫기
            },
          ),
        ),
        // 나가기 버튼
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF5634A1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            child: const Text(
              '나가기',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // 대화상자 닫기
              Navigator.of(context).pop(); // 이전 화면으로 나가기
            },
          ),
        ),
      ],
      backgroundColor: Colors.white,
      // 대화상자 배경색
      elevation: 20,
    );
  }
}
