import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/albums.dart';

class AlbumApiProvider {
  Client client = Client();

// 데이터를 가져오는데 시간이 걸릴 수 있기 때문에 비동기
  Future<Albums> fetchAlbumList() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Albums.fromJSON(data);
    } else {
      throw Exception('Failed to fetch data.');
    }
  }
}
