import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://k10a207.p.ssafy.io/api";

  static Future<void> sendReport(
      String roadAddress, String reportText, File imageFile) async {
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
      await sendImageToS3(s3Url, imageFile);
    } else {
      print("데이터 전송 실패: ${response.statusCode}");
    }
  }

  static Future<void> sendImageToS3(String url, File imageFile) async {
    var imageBytes = await imageFile.readAsBytes();
    var request = http.Request('PUT', Uri.parse(url))
      ..headers.addAll({
        'Content-Type': 'binary/octet-stream',
      })
      ..bodyBytes = imageBytes;

    var streamedResponse = await request.send();

    if (streamedResponse.statusCode == 200) {
      print("이미지를 성공적으로 전송했습니다.");
    } else {
      print("이미지 전송 실패: ${streamedResponse.statusCode}");
    }
  }
}
