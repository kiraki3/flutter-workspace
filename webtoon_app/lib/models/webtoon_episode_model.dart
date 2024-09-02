class WebtoonEpisodeModel {
  final String id, title, rating, date;
  // json 형식으로 초기화
  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
