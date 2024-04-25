import 'dart:io';

import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  String _displayText = '사진 촬영 버튼을 눌러\n신고할 장소를 찍어주세요.';
  File? _image;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  void _initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      print('Error: select a camera first.');
      return;
    }

    await _controller!.takePicture().then((XFile file) {
      setState(() {
        _image = File(file.path);
        _displayText = '사진 촬영이 완료되었습니다.';
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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
          "불편신고",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _displayText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (_image == null) {
                        return CameraPreview(_controller!);
                      } else {
                        return Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _image == null
                ? Row(
                    children: [
                      ButtonWidget(
                        text: "사진 촬영",
                        backgroundColor: lightRed,
                        onPressed: _takePicture,
                      ),
                    ],
                  )
                : Row(
                    children: <Widget>[
                      ButtonWidget(
                        text: "재촬영",
                        backgroundColor: lightPurple,
                        onPressed: () {
                          setState(() {
                            _image = null;
                            _displayText = '사진 촬영 버튼을 눌러\n신고할 장소를 찍어주세요.';
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ButtonWidget(
                        text: "다음",
                        backgroundColor: lightRed,
                        onPressed: () {},
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
