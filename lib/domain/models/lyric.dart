import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:worship_songs/domain/models/verse.dart';

part 'lyric.freezed.dart';

@freezed
class Lyric({required final int songId, required final List<Verse> verses}) with _$Lyric;
