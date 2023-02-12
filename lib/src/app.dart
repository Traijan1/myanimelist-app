import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/models/myanimelist/anime_info_entry.dart';
import 'package:myanimelist/src/pages/edit_entry_page.dart';
import 'package:myanimelist/src/pages/home_page.dart';
import 'package:myanimelist/src/pages/info_page.dart';
import 'package:myanimelist/src/pages/login_page.dart';
import 'package:myanimelist/src/services/myanimelist_service.dart';
import 'package:dynamic_color/dynamic_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: MyAnimeListService.isLoggedIn ? HomePage.route : LoginPage.route,
      routes: [
        GoRoute(
          path: HomePage.route,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: LoginPage.route,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '${InfoPage.route}/:id',
          builder: (context, state) => InfoPage(id: int.parse(state.params["id"]!)),
        ),
        GoRoute(
          path: EditEntryPage.route,
          builder: (context, state) => EditEntryPage(entry: state.extra! as AnimeInfoEntry),
        ),
      ],
    );

    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      const primarySwatch = Colors.indigo;

      return MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightDynamic ??
                ColorScheme.fromSwatch(primarySwatch: primarySwatch, brightness: Brightness.light)
                    .copyWith(primaryContainer: Colors.white)),
        darkTheme: ThemeData(
            colorScheme: darkDynamic ??
                ColorScheme.fromSwatch(primarySwatch: primarySwatch, brightness: Brightness.dark)
                    .copyWith(primaryContainer: Colors.black)),
        themeMode: ThemeMode.dark,
      );
    });
  }
}
