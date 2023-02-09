import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/models/myanimelist/anime_info_entry.dart';
import 'package:myanimelist/src/models/myanimelist/related_anime_edge.dart';
import 'package:myanimelist/src/pages/info_page.dart';
import 'package:myanimelist/src/widgets/edge_tile.dart';
import 'package:myanimelist/src/widgets/entry_list_tile.dart';
import 'package:myanimelist/src/widgets/expandable.dart';
import 'package:myanimelist/src/widgets/expandable_text.dart';
import 'package:myanimelist/src/widgets/info_card.dart';
import 'package:myanimelist/src/widgets/thumbnail.dart';

import 'expandable_list.dart';

class EntryInfo extends StatelessWidget {
  final AnimeInfoEntry entry;
  const EntryInfo({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Thumbnail(
                  url: entry.mainPicture!.medium,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      entry.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    InfoCard(
                      title: "Score",
                      leading: Icons.star,
                      value: entry.mean!.toString(),
                    ),
                    const SizedBox(height: 20),
                    InfoCard(
                      title: "Rank",
                      value: entry.rank.toString(),
                      leading: Icons.emoji_events,
                    ),
                    const SizedBox(height: 20),
                    InfoCard(
                      title: "Popularity",
                      value: entry.popularity!.toString(),
                      leading: Icons.people,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Text(
              entry.genres!
                  .map(
                    (e) => e.name,
                  )
                  .join(" • "),
              style: const TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${entry.mediaType}, ${DateTime.parse(entry.createdAt!).year}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                entry.status!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${entry.numEpisodes} ep, ${entry.averageEpisodeDuration} min",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ExpandableText(text: entry.synopsis!),
          if (entry.relatedAnime.isNotEmpty) ...[
            const SizedBox(height: 20),
            ExpandableList(
              title: "Related Anime",
              entries: entry.relatedAnime.map((e) => e.node).toList(),
              builder: (context, id) => EdgeTile(
                node: entry.relatedAnime[id].node,
                bottomRow: Text(entry.relatedAnime[id].relationTypeFormatted),
              ),
            ),
          ],
          if (entry.relatedManga.isNotEmpty) ...[
            const SizedBox(height: 10),
            ExpandableList(
              title: "Related Manga",
              entries: entry.relatedManga.map((e) => e.node).toList(),
              builder: (context, id) => EdgeTile(
                node: entry.relatedManga[id].node,
                bottomRow: Text(entry.relatedManga[id].relationTypeFormatted),
              ),
            ),
          ],
          if (entry.recommendations.isNotEmpty) ...[
            const SizedBox(height: 10),
            ExpandableList(
              title: "Recommendations",
              entries: entry.recommendations.map((e) => e.node).toList(),
              builder: (context, id) => EdgeTile(
                node: entry.recommendations[id].node,
              ),
            ),
          ],
          if (entry.studios != null && entry.studios!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Expandable(
              title: "Studios",
              child: Column(
                children: entry.studios!
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(alignment: Alignment.centerLeft, child: Text(e.name)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
