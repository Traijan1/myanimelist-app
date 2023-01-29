import 'package:flutter/material.dart';
import 'package:myanimelist/src/provider/main_page_provider.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';
import 'package:myanimelist/src/services/oauth_service.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OAuthService.checkLogIn();

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        var provider = MainPageProvider();
        MyAnimeListService.getCurrentSeason().then((value) => provider.setSeasonal(value));
        MyAnimeListService.getSuggestedAnime().then((value) => provider.setSuggested(value));
        return provider;
      },
      builder: (context, child) => const MyApp(),
    ),
  );
}
