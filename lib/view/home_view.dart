import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Center(
            child: Title(color: Colors.black, child: const Text("Songs")),
          ),
          const Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 10)),
          const _CardView(songTitle: "Bless The Lord", artist: "Matt RedMann"),
        ],
      ),
    );
}

class _CardView extends StatelessWidget {
  const new({required this._songTitle, required this._artist});

  final String _songTitle;
  final String _artist;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Card.outlined(
      child: SizedBox(
        width: 500,
        height: 60,
        child: InkWell(onTap: () => {}, child: buildCardContent()),
      ),
    ),
  );

  Padding buildCardContent() => Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildCardTitle(), buildCardSubtitle()],
    ),
  );

  Text buildCardTitle() => Text(
    _songTitle,
    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );

  Padding buildCardSubtitle() => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      _artist,
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 11,
        fontWeight: FontWeight.w200,
      ),
    ),
  );
}
