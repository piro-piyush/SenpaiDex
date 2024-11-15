import 'package:flutter/material.dart';
import 'package:senpai_dex/common/styles/text_styles.dart';
import 'package:senpai_dex/models/anime_node.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:senpai_dex/screens/anime_details_screen.dart';

class AnimeTile extends StatelessWidget {
  final AnimeNode anime;
  const AnimeTile({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AnimeDetailsScreen(id: anime.id)));
      },
      child: SizedBox(
          width: 120,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: anime.mainPicture.large,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                anime.title,
                maxLines: 3,
                style: TextStyles.mediumText,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
    );
  }
}
