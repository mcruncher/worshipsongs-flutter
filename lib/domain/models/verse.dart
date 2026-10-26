import 'package:freezed_annotation/freezed_annotation.dart';

part 'verse.freezed.dart';

@freezed
class Verse({
  required final String type,
  required final String label,
  required final String content,
}) with _$Verse;
