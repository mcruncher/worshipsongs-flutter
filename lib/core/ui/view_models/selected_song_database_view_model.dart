import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedSongDatabaseViewModel extends StateNotifier<AsyncValue<String?>> {
  static const preferenceKey = 'selected_song_database_key';

  SelectedSongDatabaseViewModel() : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    final preference = await SharedPreferences.getInstance();
    final key = preference.getString(preferenceKey);
    if (!mounted) return;
    state = AsyncValue.data(key);
  }

  Future<void> select(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(preferenceKey, key);
    if (!mounted) return;
    state = AsyncValue.data(key);
  }
}