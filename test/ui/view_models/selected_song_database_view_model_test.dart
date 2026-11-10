import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worship_songs/ui/view_models/selected_song_database_view_model.dart';

void main() {
  late SelectedSongDatabaseViewModel viewModel;

  group('SelectedSongDatabaseViewModelTest', () {
    test('Should save the selected song database', () async {
      // given
      SharedPreferences.setMockInitialValues({});
      viewModel = SelectedSongDatabaseViewModel();

      // when
      await viewModel.onSelect('songs_tamil');

      // then
      final prefs = await SharedPreferences.getInstance();
      expect(viewModel.state.value, 'songs_tamil');
      expect(prefs.getString(SelectedSongDatabaseViewModel.preferenceKey), 'songs_tamil');
    });

    test('Should load the previously selected song database', () async {
      // given
      SharedPreferences.setMockInitialValues({SelectedSongDatabaseViewModel.preferenceKey: 'songs_english'});
      viewModel = SelectedSongDatabaseViewModel();

      // when
      await viewModel.loadData();

      // then
      expect(viewModel.state.value, 'songs_english');
    });
  });
}