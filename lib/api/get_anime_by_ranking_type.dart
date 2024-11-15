import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '/config/app_config.dart';
import '/models/anime.dart';

Future<Iterable<Anime>> getAnimeByRankingTypeApi({
  required String rankingType,
  required int limit,
}) async {
  final baseUrl =
      "https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit";
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
