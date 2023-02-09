import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:myanimelist/src/models/myanimelist/anime_list_entry.dart';
import 'package:myanimelist/src/pages/info_page.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';
import 'package:myanimelist/src/widgets/entry_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController seachController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<AnimeListEntry> entries = [];
  String searchValue = "";

  static const String hintText = "Search anime/manga";

  @override
  void initState() {
    super.initState();
    scrollController.addListener(listenScrollController);
  }

  void listenScrollController() {
    print(scrollController.position.extentAfter);
    // if (scrollController.position.extentAfter < 15) {
    //   loadEntries();
    // }
  }

  void onChanged(String value) {
    if (value.length < 3) return;
    searchValue = value;

    loadEntries();
  }

  void loadEntries() {
    MyAnimeListService.getAnimes(searchValue, limit: 50).then((value) {
      setState(() => entries = value);
    });
  }

  String modifyStatus(String status) {
    switch (status) {
      case "on_hold":
        return "On Hold";
      case "plan_to_watch":
        return "Plan to watch";
      default:
        return toBeginningOfSentenceCase(status)!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: seachController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              hintText: hintText,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.none, width: 0),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: entries.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var entry = entries[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListEntryTile(
                  entry: entries[index],
                  bottomRow: [
                    if (entry.mediaType != null) ...[
                      Text(
                        entry.mediaType!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                    if (entry.numEpisodes != null) Text('${entry.numEpisodes!} ep, '),
                    if (entry.startSeason != null) ...[
                      Text('${entry.startSeason!.season} '),
                      Text('${entry.startSeason!.year}'),
                    ],
                    if (entry.myListStatus != null && entry.myListStatus!.status != null) ...[
                      const Spacer(),
                      Text(modifyStatus(entry.myListStatus!.status!))
                    ],
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
