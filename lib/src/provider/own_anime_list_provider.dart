import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:myanimelist/src/models/myanimelist/user_anime_list_entry.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';

class OwnAnimeListProvider extends ChangeNotifier {
  List<UserAnimeListEntry> _entries = [];
  List<UserAnimeListEntry> get entries => UnmodifiableListView(_entries);

  void fetchData({String? status}) async {
    _addToList(await MyAnimeListService.getUserAnimeList(status));
    notifyListeners();
  }

  void _addToList(List<UserAnimeListEntry> data) {
    for (var entry in data) {
      bool isNotInList = true;
      for (var element in _entries) {
        if (entry.entry.title == element.entry.title) {
          isNotInList = false;
          continue;
        }
      }

      if (isNotInList) _entries.add(entry);
    }
  }
}
