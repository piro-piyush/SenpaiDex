import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senpai_dex/common/styles/paddings.dart';
import 'package:senpai_dex/views/featured_animes.dart';
import 'package:senpai_dex/widgets/top_anime_list.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SenpaiDex",
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Featured animes
            SizedBox(
              height: 300,
              child: TopAnimeList(),
            ),
            // Top animes
            Padding(
              padding: Paddings.noBottomPadding,
              child: Column(
                children: [
                  //Top animes
                  SizedBox(
                    height: 350,
                    child:
                        FeaturedAnimes(rankingType: "all", label: "Top Ranked"),
                  ),
                  //Top Airing
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "airing", label: "Top Airing"),
                  ),
                  //Top Ova
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(rankingType: "ova", label: "Top Ova"),
                  ),
                  //Top Specials
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "special", label: "Top Special"),
                  ),
                  //Top Popular
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "bypopularity", label: "Top Popular"),
                  ),
                  //Top Movies
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "movie", label: "Top Movies"),
                  ),
                  //Top Favourites
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "favorite", label: "Top Favourites"),
                  ),
                  //Top Upcoming
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "upcoming", label: "Top Upcoming"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
