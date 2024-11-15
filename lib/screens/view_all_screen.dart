import 'package:flutter/material.dart';
import 'package:senpai_dex/api/get_anime_by_ranking_type.dart';
import 'package:senpai_dex/core/screens/error_screen.dart';
import 'package:senpai_dex/core/widgets/loader.dart';

class ViewAllScreen extends StatelessWidget {
  final String rankingType;
  final String label;
  const ViewAllScreen(
      {super.key, required this.rankingType, required this.label});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            getAnimeByRankingTypeApi(rankingType: rankingType, limit: limit),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          if (snapshot.data != null) {
            final animes = snapshot.data;
            return RankedAnimeListView();
          }

          return ErrorScreen(error: snapshot.error.toString());
        });
  }
}
