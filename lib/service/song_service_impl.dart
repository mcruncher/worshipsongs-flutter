import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/service/song_service.dart';

class SongServiceImpl extends SongService {
  final List<Song> _songs = [
    Song(title: "Hold Me Fast (Psalm 139)", artistName: "Aaron Shust"),
    Song(title: "Paid in Full", artistName: "The Corbans"),
    Song(
      title: "How Great Thou Art (Until That Day)",
      artistName: "Matt Redman",
    ),
    Song(title: "Beloved", artistName: "Mack Brock"),
    Song(title: "Second Chance", artistName: "Rend Collective"),
    Song(title: "The Reminder", artistName: "TAYA"),
    Song(title: "Valley of Worship", artistName: "Seph Schlueter"),
    Song(title: "Cling To The Cross", artistName: "Seph Schlueter"),
    Song(title: "Brighter Days", artistName: "Blessing Offor"),
    Song(title: "Faithful Now", artistName: "Vertical Worship"),
    Song(title: "Won't Start Now", artistName: "Seph Schlueter"),
    Song(title: "I Will Trust My Savior Jesus", artistName: "CityAlight"),
    Song(title: "Christ Be Magnified", artistName: "Cody Carnes"),
    Song(title: "Stay (Gonna Be Okay)", artistName: "Seph Schlueter"),
    Song(title: "Thank You Lord", artistName: "Chris Tomlin"),
  ];

  @override
  List<Song> getSongs() => _songs;
}
