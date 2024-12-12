import '../model/albums.dart';
import '../repository/album_repository.dart';
import 'package:rxdart/rxdart.dart';

// 비지니스 로직
class AlbumBloc {
  // 인스턴스
  final AlbumRepository _albumRepository = AlbumRepository();
  // 앨범을 가져올 수 있는 stream
  final PublishSubject<Albums> _albumFetcher = PublishSubject<Albums>();

  Stream<Albums> get allAlbums => _albumFetcher.stream;

  Future<void> fetchAllAlbums() async {
    Albums albums = await _albumRepository.fetchAllAlbums();
// 실시간으로 변형되었다는 것을 알려주는 역할
    _albumFetcher.sink.add(albums);
  }

  dispose() {
    _albumFetcher.close();
  }
}
