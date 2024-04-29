import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://k10a207.p.ssafy.io/api";

  static Future<void> sendReport(
      String roadAddress, String reportText, File imageFile) async {
    print(imageFile.path.split('/').last);
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
      print(response.body);
    } else {
      print("데이터 전송 실패: ${response.statusCode}");
    }
  }
}
