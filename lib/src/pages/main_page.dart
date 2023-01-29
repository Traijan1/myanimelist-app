import 'package:flutter/material.dart';
import 'package:myanimelist/src/provider/main_page_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/list_row.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MainPageProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ListRow(title: "Current Season", data: provider.seasonalAnime),
          ListRow(title: "Recommended", data: provider.suggestedAnime),
        ],
      ),
    );
  }
}
