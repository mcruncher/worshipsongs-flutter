class ViewSong {
  int id;
  String title;
  String artistName;

  new({required this.id, required this.title, required this.artistName});

  @override
  int get hashCode => title.hashCode + artistName.hashCode;

  @override
  bool operator ==(Object other) => (other is ViewSong)
      ? (title == other.title) && (artistName == other.artistName)
      : false;

  @override
  String toString() => "Title: $title, Artist name: $artistName";
}
