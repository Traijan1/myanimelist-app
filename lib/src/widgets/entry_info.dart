import 'package:flutter/material.dart';
import 'package:myanimelist/src/models/myanimelist/anime_info_entry.dart';

class EntryInfo extends StatelessWidget {
  final AnimeInfoEntry entry;
  const EntryInfo({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Text(entry.title);
  }
}
