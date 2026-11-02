import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/domain/models/lyrics.dart';
import 'package:worship_songs/domain/repositories/lyrics_repository.dart';
import 'package:worship_songs/ui/view_models/lyrics_view_view_model.dart';
import 'package:worship_songs/utils/providers/lyrics_provider.dart';

import 'lyrics_view_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LyricsRepository>()])
void main() {
  group("LyricsViewViewModelTest", () {
    late LyricsRepository lyricsRepository;

    setUp(() {
      lyricsRepository = MockLyricsRepository();
    });

    test("Get lyrics by song id", () {
      // setup
      when(lyricsRepository.getBySongId(1)).thenAnswer(
        (realInvocation) async => Lyrics(
          songId: 1,
          title: "Song",
          artistName: "Artist",
          verses: {},
          verseOrdering: [],
        ),
      );

      // and
      var providerContainer = ProviderContainer.test(
        overrides: [
          lyricsRepositoryProvider.overrideWith((ref) => lyricsRepository),
        ],
      );

      // when
      providerContainer.read(lyricsViewViewModelProvider(1));

      // then
      verify(lyricsRepository.getBySongId(1));
    });
  });
}
