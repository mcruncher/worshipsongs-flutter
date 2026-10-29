import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';
import 'package:worship_songs/ui/view_models/lyric_view_view_model.dart';
import 'package:worship_songs/utils/providers/lyric_provider.dart';

import 'lyric_view_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LyricRepository>()])
void main() {
  group("LyricViewViewModelTest", () {
    late LyricRepository lyricRepository;

    setUp(() {
      lyricRepository = MockLyricRepository();
    });

    test("Get lyrics by song id", () {
      // setup
      when(lyricRepository.getLyricBySongId(1)).thenAnswer(
        (realInvocation) async => Lyric(
          songId: 1,
          songName: "Song",
          artistName: "Artist",
          verseOrdering: {},
          ordering: [],
        ),
      );

      // and
      var providerContainer = ProviderContainer.test(
        overrides: [
          lyricRepositoryProvider.overrideWith((ref) => lyricRepository),
        ],
      );

      // when
      providerContainer.read(lyricViewViewModelProvider(1));

      // then
      verify(lyricRepository.getLyricBySongId(1));
    });
  });
}
