import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myanimelist/src/models/myanimelist/anime_list_entry.dart';
import 'package:myanimelist/src/models/myanimelist/user_anime_list_entry.dart';

import '../models/myanimelist/anime_entry.dart';
import '../models/myanimelist/anime_info_entry.dart';
import '../models/myanimelist/user.dart';

class MyAnimeListService {
  static String _accessToken = "";
  static String _tokenType = "";

  static late User user;
  static bool isLoggedIn = false;

  static final Map<String, String> _headers = {};

  static Future<void> initService(String accessToken, {String? tokenType}) async {
    _accessToken = accessToken;

    if (tokenType != null) {
      _tokenType = tokenType;
    }
    if (!isLoggedIn) {
      isLoggedIn = true;
      _headers.addAll({"Authorization": "$_tokenType $_accessToken"});
      await getProfile();
    }
  }

  static Future<Response> _get(String url) async {
    return await http.get(Uri.parse(url), headers: _headers);
  }

  static Future<void> getProfile() async {
    var response = await _get("https://api.myanimelist.net/v2/users/@me");

    user = User.fromJson(jsonDecode(response.body));
  }

  static Future<List<AnimeListEntry>> getAnimes(String title,
      {int limit = 50, int offset = 0}) async {
    var response = await _get(
        'https://api.myanimelist.net/v2/anime?q=$title&limit=$limit&offset=$offset&fields=num_episodes,alternative_titles,mean,start_season,num_episodes,rank,mean,media_type,my_list_status');

    List<AnimeListEntry> entries = [];

    try {
      var json = Map<String, dynamic>.from(jsonDecode(response.body));

      for (var entry in json["data"]) {
        entries.add(AnimeListEntry.fromJson(entry["node"]));
      }
    } catch (e) {
      return [];
    }

    return entries;
  }

  static Future<AnimeInfoEntry> getAnimeInfo(int id) async {
    var response =
        await _get("https://api.myanimelist.net/v2/anime/$id?fields=background,main_picture");

    return AnimeInfoEntry.fromJson(jsonDecode(response.body));
  }

  static Future<List<AnimeEntry>> getCurrentSeason() async {
    String currentSeason = "";
    int currentMonth = DateTime.now().month;
    int currentYear = DateTime.now().year;

    if (currentMonth <= 3) {
      currentSeason = "winter";
    } else if (currentMonth <= 6) {
      currentSeason = "spring";
    } else if (currentMonth <= 9) {
      currentSeason = "summer";
    } else if (currentMonth <= 12) {
      currentSeason = "fall";
    }

    var response = await _get(
        "https://api.myanimelist.net/v2/anime/season/$currentYear/$currentSeason?limit=100");

    List<AnimeEntry> entries = [];

    try {
      var json = Map<String, dynamic>.from(jsonDecode(response.body));

      for (var entry in json["data"]) {
        entries.add(AnimeEntry.fromJson(entry["node"]));
      }
    } catch (e) {
      return [];
    }

    return entries;
  }

  static Future<List<AnimeEntry>> getSuggestedAnime() async {
    var response = await _get("https://api.myanimelist.net/v2/anime/suggestions?limit=100");

    List<AnimeEntry> entries = [];

    try {
      var json = Map<String, dynamic>.from(jsonDecode(response.body));

      for (var entry in json["data"]) {
        entries.add(AnimeEntry.fromJson(entry["node"]));
      }
    } catch (e) {
      return [];
    }

    return entries;
  }

  static Future<List<UserAnimeListEntry>> getUserAnimeList() async {
    var response = await _get(
        "https://api.myanimelist.net/v2/users/@me/animelist?fields=num_episodes,list_status,mean,alternative_titles&limit=999");

    List<UserAnimeListEntry> entries = [];

    try {
      var json = Map<String, dynamic>.from(jsonDecode(response.body));

      for (var entry in json["data"]) {
        entries.add(UserAnimeListEntry.fromJson(entry));
      }
    } catch (e) {
      return [];
    }

    return entries;
  }
}
