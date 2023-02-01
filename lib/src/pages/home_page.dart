import 'package:flutter/material.dart';
import 'package:myanimelist/src/pages/list_page.dart';
import 'package:myanimelist/src/pages/main_page.dart';
import 'package:myanimelist/src/pages/search_page.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';
import 'package:provider/provider.dart';

import '../provider/main_page_provider.dart';

class HomePage extends StatefulWidget {
  static const String route = "/";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  static const List<Widget> pages = [
    MainPage(),
    SearchPage(),
    TabBarView(
      children: [
        ListPage(status: "watching"),
        ListPage(status: "completed"),
        ListPage(status: "dropped"),
        ListPage(status: "on_hold"),
        ListPage(status: "plan_to_watch"),
      ],
    ),
  ];

  static const List<String> appbarTitles = ["Home", "Search", "List"];

  void changeIndex(int index) {
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(child: Text(appbarTitles[_index])),
              Text(
                MyAnimeListService.user.name,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 15),
              CircleAvatar(
                backgroundImage: NetworkImage(MyAnimeListService.user.picture),
              ),
            ],
          ),
          bottom: _index != pages.length - 1
              ? null
              : const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Watching"),
                    Tab(text: "Completed"),
                    Tab(text: "Dropped"),
                    Tab(text: "On Hold"),
                    Tab(text: "Plan to Watch"),
                  ],
                ),
        ),
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.only(top: 5), child: pages.elementAt(_index)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: _index,
          onTap: changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          ],
        ),
      ),
    );
  }
}
