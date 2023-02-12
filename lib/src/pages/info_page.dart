import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/pages/edit_entry_page.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';
import 'package:myanimelist/src/widgets/entry_info.dart';

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
      appBar: AppBar(title: const Text("Info")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => entry.then((value) => context.push(EditEntryPage.route, extra: value)),
        child: const Icon(Icons.edit_note, size: 36),
      ),
      body: FutureBuilder(
        future: entry,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: EntryInfo(entry: snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error!.toString());
          }

          return const Text("Loading");
        },
      ),
    );
  }
}
