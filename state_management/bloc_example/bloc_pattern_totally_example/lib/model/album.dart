class Album {
  int? userId;
  int? id;
  String? title;
  Album({this.userId, this.id, this.title});

// factory 키워드로 앨범 리스트를 json 형식으로 받아와 인스턴스를 제조
  factory Album.fromJSON(Map<String, dynamic> json) =>
      Album(userId: json['userId'], id: json['id'], title: json['title']);
}
