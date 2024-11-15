import 'package:flutter/material.dart';
import 'package:senpai_dex/common/styles/paddings.dart';
import 'package:senpai_dex/models/anime.dart';

class RankedAnimeListView extends StatelessWidget {
  final Iterable<Anime> animes;
  const RankedAnimeListView({super.key, required this.animes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.defaultPadding,
      child: ListView.builder(
          itemCount: animes.length,
          itemBuilder: (context, index) {
            final anime = animes.elementAt(index);
            return AnimeListTile();
          }),
    );
  }
}
