import 'package:flutter/material.dart';
import 'package:senpai_dex/common/styles/paddings.dart';
import 'package:senpai_dex/models/anime.dart';
import 'package:senpai_dex/widgets/anime_list_tile.dart';

class RankedAnimesListView extends StatelessWidget {
  const RankedAnimesListView({
    super.key,
    required this.animes,
  });

  final Iterable<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.defaultPadding,
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes.elementAt(index);

          return AnimeListTile(
            anime: anime,
          );
        },
      ),
    );
  }
}
