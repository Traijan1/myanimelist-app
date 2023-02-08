import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:myanimelist/src/widgets/thumbnail.dart';

import '../models/myanimelist/anime_list_entry.dart';
import '../pages/info_page.dart';

class EntryTile extends StatelessWidget {
  final AnimeListEntry entry;
  final List<Widget> bottomRow;

  const EntryTile({super.key, required this.entry, required this.bottomRow});

  void navigateToInfoPage(BuildContext context, int id) {
    context.push('${InfoPage.route}/$id');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToInfoPage(context, entry.id),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (entry.mainPicture != null)
              Stack(
                children: [
                  Thumbnail(
                    url: entry.mainPicture!.medium,
                    width: 85,
                    height: 125,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: const Color(0xBB000000),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '${entry.mean}',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(children: bottomRow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
