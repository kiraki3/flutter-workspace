import '../data_provider/api_provider.dart';
import '../model/albums.dart';

// api_provider 에서 이미 가져온 데이터를 가공하고 저장하는 부분 (Data handler)
class AlbumRepository {
  final AlbumApiProvider _albumApiProvider = AlbumApiProvider();

  Future<Albums> fetchAllAlbums() async => _albumApiProvider.fetchAlbumList();
}
