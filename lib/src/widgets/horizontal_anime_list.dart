import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/myanimelist/anime_entry.dart';
import '../pages/info_page.dart';
import 'thumbnail.dart';

class HorizontalAnimeList extends StatelessWidget {
  final List<AnimeEntry> entries;

  const HorizontalAnimeList({super.key, required this.entries});

  void onTap(BuildContext context, int index) {
    context.push("${InfoPage.route}/${entries[index].id}");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 125,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => onTap(context, index),
              child: Column(
                children: [
                  Thumbnail(
                    url: entries[index].mainPicture!.medium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    entries[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
