import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_database_metadata.freezed.dart';
part 'song_database_metadata.g.dart';

@freezed
abstract class SongDatabaseMetadata with _$SongDatabaseMetadata {
  const factory SongDatabaseMetadata({
    required String key,
    required String name,
    required String description,
    required String url,
    required String language,
    required String openLpVersion,
  }) = _SongDatabaseMetadata;

  factory SongDatabaseMetadata.fromJson(Map<String, dynamic> json) => _$SongDatabaseMetadataFromJson(json);
}