import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:myanimelist/src/models/myanimelist/user_anime_list_entry.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';

class OwnAnimeListProvider extends ChangeNotifier {
  List<UserAnimeListEntry> _entries = [];
  List<UserAnimeListEntry> get entries => UnmodifiableListView(_entries);

  void fetchData() async {
    _entries = await MyAnimeListService.getUserAnimeList("Completed");
  }
}
