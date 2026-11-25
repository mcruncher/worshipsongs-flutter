import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/ui/view_models/lyrics_view_view_model.dart';
import 'package:worship_songs/ui/view_models/selected_song_database_view_model.dart';
import 'package:worship_songs/utils/providers/song_provider.dart';

import 'lyrics_view_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SongRepository>()])
void main() {
  group("LyricsViewViewModelTest", () {
    late MockSongRepository mockSongRepository;

    setUp(() {
      mockSongRepository = MockSongRepository();
    });

    test("Get song by id with lyrics", () async {
      // setup
      SharedPreferences.setMockInitialValues({
        SelectedSongDatabaseViewModel.preferenceKey: 'songs_tamil',
      });
      when(mockSongRepository.findByIdWithLyrics(1))
          .thenAnswer((_) async => Song(id: 1, title: "Test"));

      // and
      var providerContainer = ProviderContainer.test(
        overrides: [
          songRepositoryProvider('songs_tamil').overrideWith((ref) => mockSongRepository),
        ],
      );

      // when
      await providerContainer.read(lyricsViewViewModelProvider(1).future);

      // then
      verify(mockSongRepository.findByIdWithLyrics(1));
    });
  });
}
