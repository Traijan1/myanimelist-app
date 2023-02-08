import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myanimelist/src/models/myanimelist/user_anime_list_entry.dart';
import 'package:myanimelist/src/provider/own_anime_list_provider.dart';
import 'package:myanimelist/src/widgets/entry_tile.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  final String status;
  const ListPage({super.key, required this.status});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    context.read<OwnAnimeListProvider>().fetchData(status: widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OwnAnimeListProvider>(
      builder: (_, value, __) {
        var status =
            value.entries.where((element) => element.status.status == widget.status).toList();

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
          },
        );
      },
    );
  }
}
