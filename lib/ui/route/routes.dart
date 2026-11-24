import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worship_songs/ui/views/home_view.dart';
import 'package:worship_songs/ui/views/lyrics_view.dart';
import 'package:worship_songs/ui/views/settings_view.dart';
import 'package:worship_songs/ui/views/song_search_view.dart';

final route = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: "Home",
      pageBuilder: (context, state) => CupertinoPage(child: HomeView()),

      routes: [
        GoRoute(
          path: "/:song_id(\\d+)",
          name: "Lyrics View",
          pageBuilder: (context, state) => CupertinoPage(
            child: LyricsView(
              songId: int.parse(state.pathParameters["song_id"]!),
            ),
          ),
        ),
      ],
    ),

    GoRoute(
      path: "/settings",
      name: "Settings",
      pageBuilder: (context, state) => CupertinoPage(child: SettingsView()),
    ),

    GoRoute(
      path: "/search",
      name: "Search",
      pageBuilder: (context, state) => CupertinoPage(
        child: Scaffold(
          appBar: AppBar(title: Text("Search", textAlign: TextAlign.start)),
          body: SongSearchView(),
        ),
      ),
    ),
  ],
);
