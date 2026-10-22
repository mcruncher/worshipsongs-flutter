import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/ui/view_models/song_list_view_model.dart';

void main() {
  group("SongListViewModelTest", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    test("Get songs", () async {
      // setup
      var providerContainer = ProviderContainer.test();
      var firstSong = Song(id: 2281, title: "(Let Us Be)One Voice");
      var lastSong = Song(id: 964, title: "Yutham Yutham Kartharudayathu");

      // when
      var viewSongs = await providerContainer.read(
        songListViewModelProvider.future,
      );

      // then
      expectLater(viewSongs.first, firstSong);
      expectLater(viewSongs.last, lastSong);
    });
  });
}
