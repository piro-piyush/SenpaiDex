import 'package:flutter/material.dart';
import 'package:senpai_dex/api/get_anime_by_ranking_type_api.dart';
import 'package:senpai_dex/core/screens/error_screen.dart';
import 'package:senpai_dex/core/widgets/loader.dart';
import 'package:senpai_dex/screens/view_all_animes_screen.dart';
import 'package:senpai_dex/widgets/anime_tile.dart';

class FeaturedAnimes extends StatelessWidget {
  const FeaturedAnimes({
    super.key,
    required this.rankingType,
    required this.label,
  });

  final String rankingType;
  final String label;

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
              // Title part
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewAllAnimesScreen(
                              rankingType: rankingType,
                              label: label,
                            ),
                          ),
                        );
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: animes!.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    final anime = animes.elementAt(index);

                    return AnimeTile(
                      anime: anime.node,
                    );
                  },
                ),
              ),
            ],
          );
        }

        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }
}
