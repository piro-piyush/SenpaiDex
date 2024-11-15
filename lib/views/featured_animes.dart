import 'package:flutter/material.dart';
import 'package:senpai_dex/api/get_anime_by_ranking_type.dart';
import 'package:senpai_dex/core/screens/error_screen.dart';
import 'package:senpai_dex/core/widgets/loader.dart';
import 'package:senpai_dex/widgets/anime_tile.dart';

class FeaturedAnimes extends StatelessWidget {
  final String rankingType;
  final String label;

  const FeaturedAnimes(
      {super.key, required this.rankingType, required this.label});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAnimeByRankingTypeApi(rankingType: rankingType, limit: 10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          if (snapshot.data != null) {
            final animes = snapshot.data;
            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      TextButton(onPressed: () {}, child: Text("View All")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: animes!.length,
                      itemBuilder: (context, index) {
                        final anime = animes.elementAt(index);
                        return AnimeTile(anime: anime.node);
                      }),
                )
              ],
            );
          }

          return ErrorScreen(error: snapshot.error.toString());
        });
  }
}
