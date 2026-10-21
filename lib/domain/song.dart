class Song {
  int id;
  String title;

  new({required this.id, required this.title});

  @override
  int get hashCode => id.hashCode + title.hashCode;

  @override
  bool operator ==(Object other) =>
      (other is Song) ? (id == other.id) && (title == other.title) : false;

  @override
  String toString() => "Id: $id, Title: $title";
}
