import 'package:flutter/material.dart';
import 'package:senpai_dex/api/get_anime_by_ranking_type.dart';
import 'package:senpai_dex/core/screens/error_screen.dart';
import 'package:senpai_dex/core/widgets/loader.dart';
import 'package:senpai_dex/widgets/top_anime_image_slider.dart';

class TopAnimeList extends StatelessWidget {
  const TopAnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAnimeByRankingTypeApi(rankingType: "all", limit: 10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          if (snapshot.data != null) {
            final animes = snapshot.data!.toList();
            return TopAnimeImageSlider(animes: animes);
          }

          return ErrorScreen(error: snapshot.error.toString());
        });
  }
}
