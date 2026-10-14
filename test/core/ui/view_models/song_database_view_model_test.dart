import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/core/domain/models/song_database.dart';
import 'package:worship_songs/core/domain/repositories/song_database_repository.dart';
import 'package:worship_songs/core/ui/view_models/song_database_view_model.dart';

class _FakeSongDatabaseRepository implements SongDatabaseRepository {
  final List<SongDatabase> databases;
  final bool fail;

  _FakeSongDatabaseRepository({this.databases = const [], this.fail = false});

  @override
  Future<List<SongDatabase>> findAll() async {
    if (fail) throw Exception('boom');
    return databases;
  }
}

void main() {
  const database = SongDatabase(
    name: 'Tamil Worship Songs',
    description: 'Tamil songs',
    githubUrl: 'https://github.com/mcruncher/worshipsongs-db',
    language: 'Tamil',
    openLpVersion: '2.4',
  );

  test('starts loading, then exposes the databases', () async {
    final viewModel = SongDatabaseViewModel(_FakeSongDatabaseRepository(databases: [database]));
    addTearDown(viewModel.dispose);

    expect(viewModel.state.isLoading, isTrue);

    await viewModel.loadData();

    expect(viewModel.state.requireValue.single.name, 'Tamil Worship Songs');
  });

  test('exposes an error when loading fails', () async {
    final viewModel = SongDatabaseViewModel(_FakeSongDatabaseRepository(fail: true));
    addTearDown(viewModel.dispose);

    await viewModel.loadData();

    expect(viewModel.state.hasError, isTrue);
  });
}