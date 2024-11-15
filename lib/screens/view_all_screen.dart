import 'package:flutter/material.dart';
import 'package:senpai_dex/api/get_anime_by_ranking_type.dart';
import 'package:senpai_dex/core/screens/error_screen.dart';
import 'package:senpai_dex/core/widgets/loader.dart';
import 'package:senpai_dex/views/ranked_anime_list_view.dart';

class ViewAllScreen extends StatelessWidget {
  final String rankingType;
  final String label;
  const ViewAllScreen(
      {super.key, required this.rankingType, required this.label});

  static const routeName = '/view-all-animes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          label,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:
              getAnimeByRankingTypeApi(rankingType: rankingType, limit: 100),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.data != null) {
              final animes = snapshot.data;
              return RankedAnimeListView(animes: animes!);
            }

            return ErrorScreen(error: snapshot.error.toString());
          }),
    );
  }
}
