import 'dart:collection';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/domain/view_song.dart';

void main() {
  group("View Song", () {
    test("To string", () {
      var viewSong = ViewSong(id: 1, title: "Blessed be Your Name");
      expect(viewSong.toString(), "Id: 1, Title: Blessed be Your Name");
    });

    test("Hash code", () {
      var set = HashSet<ViewSong>();
      set.add(ViewSong(id: 1, title: "Blessed be Your Name"));
      set.add(ViewSong(id: 1, title: "Blessed be Your Name"));
      set.add(ViewSong(id: 2, title: "Faithful Now"));

      expect(set.length, 2);
    });
  });
}
