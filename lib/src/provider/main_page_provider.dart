import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/myanimelist/anime_entry.dart';

class MainPageProvider extends ChangeNotifier {
  List<AnimeEntry> _seasonalAnime = [];
  List<AnimeEntry> _suggesteAnime = [];

  List<AnimeEntry> get seasonalAnime => UnmodifiableListView(_seasonalAnime);
  List<AnimeEntry> get suggestedAnime => UnmodifiableListView(_suggesteAnime);

  void setSeasonal(List<AnimeEntry> value) {
    _seasonalAnime = value;
    notifyListeners();
  }

  void setSuggested(List<AnimeEntry> value) {
    _suggesteAnime = value;
    notifyListeners();
  }
}
