import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/models/myanimelist/node.dart';
import 'package:myanimelist/src/models/myanimelist/related_anime_edge.dart';
import 'package:myanimelist/src/widgets/thumbnail.dart';

import '../pages/info_page.dart';
import 'expandable.dart';

typedef ExpandedListBuilder = Widget Function(BuildContext context, int id);

class ExpandableList extends StatelessWidget {
  final String title;
  final ExpandedListBuilder builder;
  final List<Node> entries;

  const ExpandableList(
      {super.key, required this.title, required this.entries, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Expandable(
      title: title,
      child: Column(
        children: entries
            .asMap()
            .entries
            .map(
              (e) => builder(context, e.key),
            )
            .toList(),
      ),
    );
  }
}
