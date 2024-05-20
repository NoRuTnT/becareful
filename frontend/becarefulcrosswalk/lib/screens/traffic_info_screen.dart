import 'package:becarefulcrosswalk/models/intersection_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/bottom_bar.dart';

class TrafficInfoScreen extends StatefulWidget {
  final num intersectionId;
  final Crosswalk crosswalk;

  const TrafficInfoScreen({
    super.key,
    required this.intersectionId,
    required this.crosswalk,
  });

  @override
  State<TrafficInfoScreen> createState() => _TrafficInfoScreenState();
}

class _TrafficInfoScreenState extends State<TrafficInfoScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: black,
        title: Semantics(
          label: '실시간 신호정보',
          child: const Text(
            "실시간 신호정보",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Semantics(
                label: "${widget.crosswalk.sideOne}", // 여기 고쳐야해
                child: Text(
                  "${widget.crosswalk.sideOne}",
                  style: const TextStyle(
                    color: lightGray,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Semantics(
                label: '${widget.crosswalk.length} 미터 횡단보도',
                child: Text(
                  "${widget.crosswalk.length} 미터 횡단보도",
                  style: const TextStyle(
                    color: lightGray,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              StreamBuilder(
                stream: _dbRef
                    .child('traffic-lights/${widget.intersectionId}')
                    .onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData ||
                      snapshot.data?.snapshot.value == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  Map<dynamic, dynamic> trafficLightData =
                      (snapshot.data!.snapshot.value as Map<dynamic, dynamic>);

                  String lightColor =
                      trafficLightData['color'] == "green" ? "초록" : "빨간";
                  Color textColor =
                      trafficLightData['color'] == "green" ? green2 : red2;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Semantics(
                        label: '$lightColor불',
                        child: Text(
                          "$lightColor불",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Semantics(
                        label: '${trafficLightData['remainingTime']}초',
                        child: Text(
                          "${trafficLightData['remainingTime']}초",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 50),
                      child: Semantics(
                        label: '횡단보도 이미지',
                        child: const Column(
                          children: [
                            crosswalk_box(),
                            crosswalk_box(),
                            crosswalk_box(),
                            crosswalk_box(),
                            crosswalk_box(),
                            crosswalk_box(),
                            crosswalk_box(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Semantics(
                      label: '내 위치 아이콘',
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade100.withOpacity(0.6),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade600.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class crosswalk_box extends StatelessWidget {
  const crosswalk_box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        child: Container(
          width: 300,
          height: 25,
          color: white,
        ),
      ),
    );
  }
}
