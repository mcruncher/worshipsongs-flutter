class SongDatabase {
  final String name;
  final String description;
  final String githubUrl;
  final String language;
  final String openLpVersion;

  const SongDatabase({
    required this.name,
    required this.description,
    required this.githubUrl,
    required this.language,
    required this.openLpVersion,
  });

  factory SongDatabase.fromJson(Map<String, dynamic> json) {
    return SongDatabase(
      name: json['name'] as String,
      description: json['description'] as String,
      githubUrl: json['githubUrl'] as String,
      language: json['language'] as String,
      openLpVersion: json['openLpVersion'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'githubUrl': githubUrl,
      'language': language,
      'openLpVersion': openLpVersion,
    };
  }
}