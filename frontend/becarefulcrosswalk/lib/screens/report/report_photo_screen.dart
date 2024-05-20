import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:becarefulcrosswalk/provider/report_data.dart';
import 'package:becarefulcrosswalk/screens/report/report_location_screen.dart';
import 'package:becarefulcrosswalk/theme/colors.dart';
import 'package:becarefulcrosswalk/utils/bottom_bar.dart';
import 'package:becarefulcrosswalk/widgets/button_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportPhotoScreen extends StatefulWidget {
  const ReportPhotoScreen({super.key});

  @override
  State<ReportPhotoScreen> createState() => _ReportPhotoScreenState();
}

class _ReportPhotoScreenState extends State<ReportPhotoScreen> {
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
    setState(() {});
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      print('Error: select a camera first.');
      return;
    }

    final player = AudioPlayer();
    await player.play(AssetSource('sounds/cameraFlash.mp3'));

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
          "불편신고(1/3)",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                        return Semantics(
                          label: '후면 카메라 작동 중',
                          child: CameraPreview(_controller!),
                        );
                      } else {
                        return Semantics(
                          label: '촬영된 사진',
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    } else {
                      return Semantics(
                        label: '카메라 준비중',
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
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
                      Expanded(
                        child: ButtonWidget(
                          text: "사진 촬영",
                          backgroundColor: lightRed,
                          onPressed: _takePicture,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Expanded(
                        child: ButtonWidget(
                          text: "재촬영",
                          backgroundColor: lightPurple,
                          onPressed: () {
                            setState(() {
                              Provider.of<ReportData>(context, listen: false)
                                  .clearImageFile();
                              Provider.of<ReportData>(context, listen: false)
                                  .clearRoadAddress();
                              _image = null;
                              _displayText = '사진 촬영 버튼을 눌러\n신고할 장소를 찍어주세요.';
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          text: "다음",
                          backgroundColor: lightRed,
                          onPressed: () {
                            if (_image != null) {
                              Provider.of<ReportData>(context, listen: false)
                                  .setImageFile(_image!);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportLocationScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
