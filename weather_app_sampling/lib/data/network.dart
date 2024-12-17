import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  final String url;
  final String url2;
  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    // 상태 코드 출력
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      print('Received Data: $parsingData'); // 응답 데이터 확인
      return parsingData;
    } else {
      print('Failed to load data. Status Code: ${response.statusCode}');
      return null; // 실패 시 null 반환
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));

    // 상태 코드 출력
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      print('Received Data: $parsingData'); // 응답 데이터 확인
      return parsingData;
    } else {
      print('Failed to load data. Status Code: ${response.statusCode}');
      return null; // 실패 시 null 반환
    }
  }
}
