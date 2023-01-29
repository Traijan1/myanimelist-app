import 'package:flutter/material.dart';

import '../models/myanimelist/anime_entry.dart';
import 'horizontal_anime_list.dart';

class ListRow extends StatelessWidget {
  final List<AnimeEntry> data;
  final String title;

  const ListRow({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Text("")
        : Flexible(
            child: Column(
              children: [
                Text(title, style: Theme.of(context).textTheme.headline6),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: HorizontalAnimeList(
                      entries: data,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
