import 'package:rick_morty_practice/src/domain/models/episode.dart';
import 'package:rick_morty_practice/src/domain/repositories/episodes_repository.dart';

class EpisodesUseCase {
  final EpisodesRepository _episodesRepository;

  const EpisodesUseCase({
    required EpisodesRepository episodesRepository,
  }) : _episodesRepository = episodesRepository;

  Future<Episode> getEpisode({
    required String url,
  }) {
    return _episodesRepository.getEpisode(
      url: url,
    );
  }
}
