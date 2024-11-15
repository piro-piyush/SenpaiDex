import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:senpai_dex/common/utils/utils.dart';

import '/config/app_config.dart';
import '/models/anime.dart';

Future<Iterable<Anime>> getSeasonalAnimesApi({
  required int limit,
}) async {
  final year = DateTime.now().year;
  final season = getCurrentSeason();
  final baseUrl =
      "https://api.myanimelist.net/v2/anime/season/$year/$season?$limit=4";
  final response = await http
      .get(Uri.parse(baseUrl), headers: {'X-MAL-CLIENT-ID': clientId});

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> animeNodeList = data['data'];
    final animes = animeNodeList
        .where((animeNode) => animeNode['node']['main_picture'] != null)
        .map((node) => Anime.fromJson(node));
    return animes;
  } else {
    debugPrint("Error : ${response.statusCode}");
    debugPrint("Body : ${response.body}");
    throw Exception("Failed to get Data!");
  }
}
