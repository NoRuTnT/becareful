import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:flutter/material.dart';

class ReportSttScreen extends StatefulWidget {
  const ReportSttScreen({super.key});

  @override
  State<ReportSttScreen> createState() => _ReportSttScreenState();
}

class _ReportSttScreenState extends State<ReportSttScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "말씀하신 내용을\n텍스트로 변환 중입니다\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
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
