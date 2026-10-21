import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';
import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/provider/song_provider.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group("View Song Provider", () {
    test("Get songs", () async {
      var providerContainer = ProviderContainer.test();
      var firstSong = Song(
        id: 3,
        title: "Glory (3) To the lamb",
      );

      var lastSong = Song(
        id: 2559,
        title: "My Worth Is Not In What I Own",
      );

      var viewSongs = await providerContainer.read(songsProvider.future);

      expectLater(viewSongs.first, firstSong);
      expectLater(viewSongs.last, lastSong);
    });
  });
}
