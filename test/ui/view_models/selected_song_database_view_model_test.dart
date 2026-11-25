import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worship_songs/ui/view_models/selected_song_database_view_model.dart';

void main() {
  late SelectedSongDatabaseViewModel viewModel;

  group('SelectedSongDatabaseViewModelTest', () {
    test('Should save the selected song database', () async {
      // given
      SharedPreferences.setMockInitialValues({});
      final container = ProviderContainer.test();
      await container.read(selectedSongDatabaseViewModelProvider.future);


      // when
      await container.read(selectedSongDatabaseViewModelProvider.notifier).onSelect('songs_tamil');

      // then
      final prefs = await SharedPreferences.getInstance();
      expect(container.read(selectedSongDatabaseViewModelProvider).value, 'songs_tamil');
      expect(prefs.getString(SelectedSongDatabaseViewModel.preferenceKey), 'songs_tamil');
    });

    test('Should load the previously selected song database', () async {
      // given
      SharedPreferences.setMockInitialValues({SelectedSongDatabaseViewModel.preferenceKey: 'songs_english'});
      final container = ProviderContainer.test();

      // when
      final selected = await container.read(selectedSongDatabaseViewModelProvider.future);

      // then
      expect(selected, 'songs_english');
    });
  });
}