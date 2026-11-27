import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worship_songs/ui/components/common_navigation_view.dart';
import 'package:worship_songs/ui/views/lyrics_view.dart';
import 'package:worship_songs/ui/views/settings_view.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';
import 'package:worship_songs/ui/views/song_search_view.dart';

final route = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: "Home",
      pageBuilder: (context, state) => const CupertinoPage(
        child: CommonNavigationView(path: "Home", child: SongListView()),
      ),

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
      pageBuilder: (context, state) => const CupertinoPage(
        child: CommonNavigationView(path: "Settings", child: SettingsView()),
      ),
    ),
  ],
);
