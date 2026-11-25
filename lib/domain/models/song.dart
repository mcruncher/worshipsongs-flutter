import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

@freezed
class Song({
  required final int id,
  required final String title,
  final Map<String, String>? verses,
  final List<String>? verseOrdering,
}) with _$Song;
