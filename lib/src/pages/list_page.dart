import 'package:flutter/material.dart';
import 'package:myanimelist/src/models/myanimelist/user_anime_list_entry.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';
import 'package:myanimelist/src/widgets/entry_tile.dart';

class ListPage extends StatefulWidget {
  final String status;
  const ListPage({super.key, required this.status});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<UserAnimeListEntry>> list;

  @override
  void initState() {
    super.initState();
    list = MyAnimeListService.getUserAnimeList(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var status = snapshot.data!;

          return ListView.builder(
              itemCount: status.length,
              itemBuilder: (context, index) {
                var entry = status[index];
                var episodesWatched = entry.status.numEpisodesWatched;
                var numEpisodes = entry.entry.numEpisodes;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: EntryTile(
                    entry: entry.entry,
                    bottomRow: [
                      Flexible(
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            if (numEpisodes != null && numEpisodes != 0) ...[
                              SizedBox(
                                height: 10,
                                child: LinearProgressIndicator(
                                  value: episodesWatched / numEpisodes,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                            Row(
                              children: [
                                Expanded(child: Text('Score: ${entry.status.score}')),
                                Text('$episodesWatched/$numEpisodes ep'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
