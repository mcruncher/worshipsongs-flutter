import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric.freezed.dart';

@freezed
class Lyric({
  required final int songId,
  required final String songName,
  required final String artistName,
  required final Map<String, String> verseOrdering,
  required final List<String> ordering,
}) with _$Lyric;
