import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worship_songs/core/ui/view_models/selected_song_database_view_model.dart';

void main() {
  late SelectedSongDatabaseViewModel viewModel;

  group('SelectedSongDatabaseViewModelTest', () {
    test('Should save the selected song database', () async {
      // given
      SharedPreferences.setMockInitialValues({});
      viewModel = SelectedSongDatabaseViewModel();

      // when
      await viewModel.select('tamil_worship_songs');

      // then
      final prefs = await SharedPreferences.getInstance();
      expect(viewModel.state.value, 'tamil_worship_songs');
      expect(prefs.getString(SelectedSongDatabaseViewModel.preferenceKey), 'tamil_worship_songs');
    });

    test('Should load the previously selected song database', () async {
      // given
      SharedPreferences.setMockInitialValues({SelectedSongDatabaseViewModel.preferenceKey: 'english_worship_songs'});
      viewModel = SelectedSongDatabaseViewModel();

      // when
      await viewModel.loadData();

      // then
      expect(viewModel.state.value, 'english_worship_songs');
    });
  });
}