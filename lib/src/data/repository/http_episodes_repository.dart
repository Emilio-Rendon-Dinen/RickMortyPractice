import 'dart:convert';

import 'package:rick_morty_practice/src/domain/models/episode.dart';
import 'package:rick_morty_practice/src/domain/repositories/episodes_repository.dart';
import 'package:http/http.dart' as http;

class HttpEpisodesRepository extends EpisodesRepository {
  const HttpEpisodesRepository();

  @override
  Future<Episode> getEpisode({
    required String url,
  }) async {
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      throw 'invalid_url';
    }

    final http.Response response = await http.get(uri);
    final dynamic data = jsonDecode(response.body);
    if (data is! Map) {
      throw 'unexpected_data';
    }

    final Episode? episode = Episode.parseToObject(data);
    if (episode == null) {
      throw 'unparsed_data';
    }

    return episode;
  }
}
