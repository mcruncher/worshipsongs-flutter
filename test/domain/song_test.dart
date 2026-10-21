import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/domain/song.dart';

void main() {
  group("Song", () {
    test("To string", () {
      var viewSong = Song(id: 1, title: "Blessed be Your Name");
      expect(viewSong.toString(), "Id: 1, Title: Blessed be Your Name");
    });

    test("Hash code", () {
      var set = HashSet<Song>();
      set.add(Song(id: 1, title: "Blessed be Your Name"));
      set.add(Song(id: 1, title: "Blessed be Your Name"));
      set.add(Song(id: 2, title: "Faithful Now"));

      expect(set.length, 2);
    });
  });
}
