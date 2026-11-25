import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_database_metadata.freezed.dart';
part 'song_database_metadata.g.dart';

@freezed
@JsonSerializable()
class SongDatabaseMetadata({
  required final String key,
  required final String name,
  required final String description,
  required final String url,
  required final String language,
  required final String openLpVersion,
}) with _$SongDatabaseMetadata {
  factory SongDatabaseMetadata.fromJson(Map<String, dynamic> json) => _$SongDatabaseMetadataFromJson(json);
}