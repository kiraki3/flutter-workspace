import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon_app/models/webtoon_detail_model.dart';
import 'package:webtoon_app/models/webtoon_episode_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  //하트 버튼이 눌릴 때 호출
  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons'); // 저장된 데이터 가져오기
    if (likedToons != null) {
      if (isLiked) {
        // 현재 아이템이 좋아요 상태인지 여부
        likedToons.remove(widget.id); // 사용자가 하트를 다시 클릭하여 좋아요를 취소
      } else {
        likedToons.add(widget.id); // 리스트가 저장된 적이 없으니 추가
      }
      await prefs.setStringList('likedToons',
          likedToons); // set 호출하여 업데이트된 likedToons 리스트를 SharedPreferences에 저장
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: onHeartTap,
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_outline,
                ))
          ],
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget.id,
                      child: Container(
                        width: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(10, 10),
                                color: Colors.black26,
                              )
                            ]),
                        child: Image.network(
                          widget.thumb,
                          headers: const {
                            'User-Agent':
                                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                            'Referer': 'https://comic.naver.com',
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      );
                    }
                    return const Text("....");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: episodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var episode in snapshot.data!.length > 10
                              ? snapshot.data!.sublist(0, 10)
                              : snapshot.data!)
                            Episode(episode: episode, webtoonId: widget.id),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
