import 'package:flutter/material.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';

import '../models/myanimelist/anime_info_entry.dart';

class InfoPage extends StatefulWidget {
  static const String route = "/info";
  final int id;

  const InfoPage({super.key, required this.id});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late Future<AnimeInfoEntry> entry;

  @override
  void initState() {
    super.initState();

    entry = MyAnimeListService.getAnimeInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: entry,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var map = snapshot.data!;

              return Text(map.title);
            } else if (snapshot.hasError) {
              return Text(snapshot.error!.toString());
            }

            return const Text("Loading");
          },
        ),
      ),
    );
  }
}
