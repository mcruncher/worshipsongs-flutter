import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/domain/models/song_database_metadata.dart';
import 'package:worship_songs/domain/repositories/song_database_metadata_repository.dart';
import 'package:worship_songs/ui/view_models/song_database_view_model.dart';
import 'package:worship_songs/utils/providers/song_database_providers.dart';

import 'song_database_view_model_test.mocks.dart';

@GenerateMocks([SongDatabaseMetadataRepository])
void main() {
  late MockSongDatabaseMetadataRepository repository;

  setUp(() {
    repository = MockSongDatabaseMetadataRepository();
  });

  group('SongDatabaseViewModelTest', () {
    final tamil = SongDatabaseMetadata(
      key: 'songs_tamil',
      name: 'Tamil Worship Songs',
      description: 'Tamil songs',
      url: 'https://github.com/mcruncher/worshipsongs-db-dev',
      language: 'Tamil',
      openLpVersion: '2.4',
    );

    test('Should load the available song databases', () async {
      // given
      when(repository.findAll()).thenAnswer((_) async => [tamil]);
      final container = ProviderContainer.test(
        overrides: [songDatabaseMetadataRepositoryProvider.overrideWith((ref) => repository)],
      );

      // when
      final databases = await container.read(songDatabaseViewModelProvider.future);

      // then
      verify(repository.findAll());
      expect(databases, [tamil]);
    });

    test('Should expose an error when loading fails', () async {
      // given
      when(repository.findAll()).thenAnswer((_) async => throw Exception('Failed to load'));
      final container = ProviderContainer.test(
        retry: (retryCount, error) => null,
        overrides: [songDatabaseMetadataRepositoryProvider.overrideWith((ref) => repository)],
      );

      // when
      await expectLater(container.read(songDatabaseViewModelProvider.future), throwsException);

      // then
      expect(container.read(songDatabaseViewModelProvider).hasError, true);
    });
  });
}