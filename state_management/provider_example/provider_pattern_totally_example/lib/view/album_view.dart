import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern_totally_example/model/album.dart';
import 'package:provider_pattern_totally_example/provider/album_provider.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Pattern"),
      ),
      body: Consumer<AlbumProvider>(
        builder: (context, provider, child) {
          albumList = provider.getAlbumList();
          return ListView.builder(
              itemCount: albumList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("UserId: ${albumList[index].userId.toString()}"),
                      Text("ID: ${albumList[index].id.toString()}"),
                      Text("Title: ${albumList[index].title}"),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
