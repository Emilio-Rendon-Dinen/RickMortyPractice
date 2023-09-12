import 'package:rick_morty_practice/src/domain/models/episode.dart';

abstract class EpisodesRepository {
  const EpisodesRepository();

  Future<Episode> getEpisode({
    required String url,
  });
}
