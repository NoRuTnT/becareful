import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/userGuide');
              break;
            case 1:
              Navigator.pushNamed(context, '/map');
              break;
            case 2:
              Navigator.pushNamed(context, '/report');
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/information.png', width: 35, height: 35),
            label: '이용방법',
          ),
          BottomNavigationBarItem(
              icon: Image.asset('images/map.png', width: 35, height: 35),
              label: '신호정보'),
          BottomNavigationBarItem(
              icon: Image.asset('images/report.png', width: 35, height: 35),
              label: '불편신고'),
        ],
      ),
    );
  }
}
