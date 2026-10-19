import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';
import 'package:worship_songs/domain/view_song.dart';
import 'package:worship_songs/provider/view_song_provider.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group("View Song Provider", () {
    test("Get songs", () async {
      var providerContainer = ProviderContainer.test();
      var firstSong = ViewSong(
        id: 3,
        title: "Glory (3) To the lamb",
        artistName: "Author Unknown {ஆசிரியர் தெரியவில்லை}",
      );

      var lastSong = ViewSong(
        id: 2559,
        title: "My Worth Is Not In What I Own",
        artistName: "Kristyn Getty",
      );

      var viewSongs = await providerContainer.read(viewSongsProvider.future);

      expectLater(viewSongs.first, firstSong);
      expectLater(viewSongs.last, lastSong);
    });

    test("Get total songs", () async {
      var providerContainer = ProviderContainer.test();
      int totalSongs = await providerContainer.read(totalSongsProvider.future);

      expectLater(totalSongs, 1532);
    });
  });
}
