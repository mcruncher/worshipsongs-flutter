import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/ui/view_models/song_list_view_model.dart';
import 'package:worship_songs/utils/providers/song_provider.dart';

import 'song_list_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SongRepository>()])
void main() {
  group("SongListViewModelTest", () {
    late MockSongRepository mockSongRepository;

    setUp(() {
      mockSongRepository = MockSongRepository();
    });

    test("Get songs", () async {
      // setup
      when(mockSongRepository.findAll())
          .thenAnswer((realInvocation) async => [Song(id: 1, title: "Test")]);

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
