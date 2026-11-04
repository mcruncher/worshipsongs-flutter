import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/ui/view_models/song_list_view_model.dart';
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
      when(mockSongRepository.findByIdWithLyrics(1)).thenAnswer(
        (realInvocation) async => Song(
          id: 1,
          title: "Test",
          verses: {"v1": "Hello"},
          verseOrdering: ["v1", "v1"],
        ),
      );

      // and
      var providerContainer = ProviderContainer.test(
        overrides: [
          songRepositoryProvider.overrideWith((ref) => mockSongRepository),
        ],
      );

      // when
      await providerContainer.read(songListViewModelProvider.future);

      // then
      verify(mockSongRepository.findAll());
    });
  });
}
