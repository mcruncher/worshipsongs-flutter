import 'package:go_router/go_router.dart';
import 'package:worship_songs/ui/views/home_view.dart';
import 'package:worship_songs/ui/views/lyric_view.dart';
import 'package:worship_songs/ui/views/settings_view.dart';

final route = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: "Home",
      builder: (context, state) => HomeView(),

      routes: [
        GoRoute(
          path: "/:song_id(\\d+)",
          name: "Lyrics View",
          builder: (context, state) =>
              LyricView(songId: int.parse(state.pathParameters["song_id"]!)),
        ),
      ],
    ),

    GoRoute(
      path: "/settings",
      name: "Settings",
      builder: (context, state) => SettingsView(),
    ),
  ],
);
