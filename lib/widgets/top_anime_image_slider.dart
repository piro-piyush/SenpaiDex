import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:senpai_dex/constants/app_colors.dart';
import 'package:senpai_dex/models/anime.dart';

class TopAnimeImageSlider extends StatefulWidget {
  final Iterable<Anime> animes;
  const TopAnimeImageSlider({super.key, required this.animes});

  @override
  State<TopAnimeImageSlider> createState() => _TopAnimeImageSliderState();
}

class _TopAnimeImageSliderState extends State<TopAnimeImageSlider> {
  int _currentPageIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
              carouselController: _controller,
              itemCount: widget.animes.length,
              itemBuilder: (context, index, realIndex) {
                final anime = widget.animes.elementAt(index);
                return TopAnimePicture(anime: anime);
              },
              options: CarouselOptions(
                enlargeFactor: 0.22,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                aspectRatio: 16 / 9,
                viewportFraction: 0.75,
                autoPlay: true,
                enlargeCenterPage: true,
                initialPage: _currentPageIndex,
              )),
          const SizedBox(
            height: 20,
          ),
          AnimatedSmoothIndicator(
            activeIndex: _currentPageIndex,
            count: widget.animes.length,
            effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                    rotationAngle: 90,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.blueColor,
                    width: 28,
                    height: 8),
                dotDecoration: DotDecoration(
                    borderRadius: BorderRadius.circular(8),
                    width: 28,
                    height: 8,
                    color: Theme.of(context).primaryColor)),
          )
        ],
      ),
    );
  }
}

class TopAnimePicture extends StatelessWidget {
  final Anime anime;
  const TopAnimePicture({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            anime.node.mainPicture.large,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
