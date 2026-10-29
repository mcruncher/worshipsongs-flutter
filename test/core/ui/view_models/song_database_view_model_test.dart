import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';
import 'package:worship_songs/core/domain/repositories/song_database_metadata_repository.dart';
import 'package:worship_songs/core/ui/view_models/song_database_view_model.dart';

import 'song_database_view_model_test.mocks.dart';

@GenerateMocks([SongDatabaseMetadataRepository])
void main() {
  late MockSongDatabaseMetadataRepository repository;

  setUp(() {
    repository = MockSongDatabaseMetadataRepository();
  });

  group('SongDatabaseViewModelTest', () {
    const tamil = SongDatabaseMetadata(
      key: 'tamil_worship_songs',
      name: 'Tamil Worship Songs',
      description: 'Tamil songs',
      url: 'https://github.com/mcruncher/worshipsongs-db',
      language: 'Tamil',
      openLpVersion: '2.4',
    );

    test('Should load the available song databases', () async {
      // given
      when(repository.findAll()).thenAnswer((_) async => [tamil]);
      final viewModel = SongDatabaseViewModel(repository);

      // when
      await viewModel.loadData();

      // then
      verify(repository.findAll());
      expect(viewModel.state.value, [tamil]);
    });

    test('Should expose an error when loading fails', () async {
      // given
      when(repository.findAll()).thenAnswer((_) async => throw Exception('Failed to load'));
      final viewModel = SongDatabaseViewModel(repository);

      // when
      await viewModel.loadData();

      // then
      expect(viewModel.state.hasError, true);
    });
  });
}