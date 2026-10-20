import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:worship_songs/provider/view_song_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(viewSongsProvider)
      .when(
        data: (data) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            Widget widget = index == 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(child: const Text("Songs")),
                  )
                : _CardView(songTitle: data.elementAt(index - 1).title);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: widget,
            );
          },
        ),
        error: (error, stackTrace) => Text("error $stackTrace"),
        loading: () => Skeletonizer(
          child: ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) =>
                _CardView(songTitle: "Some song title"),
          ),
        ),
      );
}

class _CardView extends StatelessWidget {
  const new({required this._songTitle});

  final String _songTitle;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Card.outlined(
      child: SizedBox(
        width: 500,
        height: 50,
        child: InkWell(
          onTap: () => {},
          child: Container(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: buildCardTitle(),
            ),
          ),
        ),
      ),
    ),
  );

  Text buildCardTitle() => Text(
    _songTitle,
    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );
}
