import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'selected_song_database_view_model.g.dart';

@riverpod
class SelectedSongDatabaseViewModel extends _$SelectedSongDatabaseViewModel {
  static const preferenceKey = 'selected_song_database_key';

  @override
  FutureOr<String?> build() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(preferenceKey);
  }

  Future<void> onSelect(String key) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(preferenceKey, key);
    if (!ref.mounted) return;
    state = AsyncValue.data(key);
  }
}