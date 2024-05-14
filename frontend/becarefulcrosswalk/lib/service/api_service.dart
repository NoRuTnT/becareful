import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/intersection_model.dart';

class ApiService {
  static const String baseUrl = "https://k10a207.p.ssafy.io/api";
  final headers = {'Content-Type': 'application/json; charset=utf-8'};

  static Future<bool> sendReport(
      String roadAddress, String reportText, File imageFile) async {
    try {
      final url = Uri.parse('$baseUrl/report');

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'location': roadAddress,
          'detail': reportText,
          'imgName': imageFile.path.split('/').last,
        }),
      );

      if (response.statusCode == 200) {
        print("성공적으로 데이터를 전송했습니다.");
        var data = json.decode(response.body);
        String s3Url = data['result'];
        return await sendImageToS3(s3Url, imageFile);
      } else {
        print("데이터 전송 실패: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("예외 발생: $e");
      return false;
    }
  }

  static Future<bool> sendImageToS3(String url, File imageFile) async {
    try {
      var imageBytes = await imageFile.readAsBytes();
      var request = http.Request('PUT', Uri.parse(url))
        ..headers.addAll({
          'Content-Type': 'binary/octet-stream',
        })
        ..bodyBytes = imageBytes;

      var streamedResponse = await request.send();

      if (streamedResponse.statusCode == 200) {
        print("이미지를 성공적으로 전송했습니다.");
        return true;
      } else {
        print("이미지 전송 실패: ${streamedResponse.statusCode}");
        return false;
      }
    } catch (e) {
      print("예외 발생: $e");
      return false;
    }
  }

  static Future<IntersectionModel> getIntersection(int intersectionId) async {
    final url = Uri.parse('$baseUrl/intersection/$intersectionId');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final utf8DecodedBody = utf8.decode(response.bodyBytes);
      log(utf8DecodedBody);

      final Map<String, dynamic> jsonMap = jsonDecode(utf8DecodedBody);
      final resultJson = jsonMap['result'];
      final intersection = IntersectionModel.fromJson(resultJson);

      print('Intersection ID: ${intersection.intersectionId}');
      print('Crosswalk Count: ${intersection.crosswalkList.length}');
      for (final crosswalk in intersection.crosswalkList) {
        print(
            'Crosswalk ID: ${crosswalk.crosswalkId}, Side One: ${crosswalk.sideOne}, Side Two: ${crosswalk.sideTwo}');
      }

      return intersection;
    }
    log("교차로 정보 받아오지 못했음");
    throw Error();
  }
}
