import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/widgets/thumbnail.dart';

import '../models/myanimelist/anime_entry.dart';
import '../pages/info_page.dart';

class EntryGrid extends StatelessWidget {
  final List<AnimeEntry> entries;
  const EntryGrid({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: entries.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 0.0, mainAxisSpacing: 0, childAspectRatio: 0.6),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.push('${InfoPage.route}/${entries[index].id}'),
        child: Column(
          children: [
            Thumbnail(
              url: entries[index].mainPicture!.large!,
              width: 100,
              height: 150,
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
    );
  }
}
