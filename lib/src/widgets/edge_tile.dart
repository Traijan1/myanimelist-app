import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/models/myanimelist/node.dart';
import 'package:myanimelist/src/models/myanimelist/related_anime_edge.dart';
import 'package:myanimelist/src/widgets/thumbnail.dart';

import '../pages/info_page.dart';

class EdgeTile extends StatelessWidget {
  final Node node;
  final Widget? bottomRow;

  const EdgeTile({super.key, required this.node, this.bottomRow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => context.push('${InfoPage.route}/${node.id}'),
        child: Row(
          children: [
            Thumbnail(
              url: node.mainPicture.medium,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    node.title,
                  ),
                  const SizedBox(height: 5),
                  if (bottomRow != null) bottomRow!
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
