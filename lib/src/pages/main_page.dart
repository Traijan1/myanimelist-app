import 'package:flutter/material.dart';
import 'package:myanimelist/src/provider/main_page_provider.dart';
import 'package:myanimelist/src/widgets/entry_grid.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final int index;
  const MainPage({super.key, required this.index});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final EdgeInsets _padding = const EdgeInsets.only(top: 7.5);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MainPageProvider>();

    if (widget.index == 0) {
      return Padding(padding: _padding, child: EntryGrid(entries: provider.seasonalAnime));
    } else {
      return Padding(padding: _padding, child: EntryGrid(entries: provider.suggestedAnime));
    }
  }
}
