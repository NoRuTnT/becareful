import 'package:becarefulcrosswalk/provider/current_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = Provider.of<CurrentPage>(context).currentPage;

    return Container(
      decoration: const BoxDecoration(
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
              if (currentRoute != '/userGuide') {
                Provider.of<CurrentPage>(context, listen: false)
                    .setCurrentPage('/userGuide');
                Navigator.pushReplacementNamed(context, '/userGuide');
              }
              break;
            case 1:
              if (currentRoute != '/map') {
                Provider.of<CurrentPage>(context, listen: false)
                    .setCurrentPage('/map');
                Navigator.pushReplacementNamed(context, '/map');
              }
              break;
            case 2:
              if (currentRoute != '/report') {
                Provider.of<CurrentPage>(context, listen: false)
                    .setCurrentPage('/report');
                Navigator.pushReplacementNamed(context, '/report');
              }
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
