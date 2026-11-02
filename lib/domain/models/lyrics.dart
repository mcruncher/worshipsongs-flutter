import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyrics.freezed.dart';

@freezed
class Lyrics({
  required final int songId,
  required final String title,
  required final String artistName,
  required final Map<String, String> verses,
  required final List<String> verseOrdering,
}) with _$Lyrics;
