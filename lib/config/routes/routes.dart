import 'package:flutter/cupertino.dart';
import 'package:senpai_dex/screens/category_animes_screen.dart';
import 'package:senpai_dex/screens/view_all_screen.dart';
import 'package:senpai_dex/screens/view_all_seasonal_animes_screen.dart';

import '/common/widgets/network_image_view.dart';
import '/core/screens/error_screen.dart';
import '/models/anime_category.dart';
import '/screens/anime_details_screen.dart';
import '/screens/home_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AnimeDetailsScreen.routeName:
      final id = settings.arguments as int;
      return _cupertinoRoute(
        view: AnimeDetailsScreen(id: id),
      );

    case ViewAllScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final rankingType = arguments['rankingType'] as String;
      final label = arguments['label'] as String;
      return _cupertinoRoute(
        view: ViewAllScreen(
          rankingType: rankingType,
          label: label,
        ),
      );

    case ViewAllSeasonalAnimesScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final label = arguments['label'] as String;
      return _cupertinoRoute(
        view: ViewAllSeasonalAnimesScreen(
          label: label,
        ),
      );

    case CategoryAnimesScreen.routeName:
      final category = settings.arguments as AnimeCategory;
      return _cupertinoRoute(
        view: CategoryAnimesScreen(
          category: category,
        ),
      );

    case HomeScreen.routeName:
      final index = settings.arguments as int?;
      return _cupertinoRoute(
        view: HomeScreen(
          index: index,
        ),
      );

    case NetworkImageView.routeName:
      final imageUrl = settings.arguments as String;
      return _cupertinoRoute(
        view: NetworkImageView(
          url: imageUrl,
        ),
      );

    default:
      return _cupertinoRoute(
        view: const ErrorScreen(
          error: 'The route you entered doesn\'t exist',
        ),
      );
  }
}

CupertinoPageRoute _cupertinoRoute({
  required Widget view,
}) {
  return CupertinoPageRoute(
    builder: (_) => view,
  );
}
