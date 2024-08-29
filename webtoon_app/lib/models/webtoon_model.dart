class WebtoonModel {
  final String title, thumb, id;

  // JSON 데이터를 객체로 변환하는 생성자
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
