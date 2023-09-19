import 'package:flutter/material.dart';
import 'package:rick_morty_practice/src/domain/models/episode.dart';
import 'package:rick_morty_practice/src/domain/use_cases/episodes_use_case.dart';
import 'package:rick_morty_practice/src/presentation/models/snapshot_data.dart';

class CharacterInfoNotifier extends ChangeNotifier {
  final EpisodesUseCase _episodesUseCase;

  CharacterInfoNotifier({
    required EpisodesUseCase episodesUseCase,
  }) : _episodesUseCase = episodesUseCase;

  SnapshotData<Episode?> _snapShotDataEpisode = SnapshotData.initial(data: null);
  SnapshotData<Episode?> get snapShotDataEpisode => _snapShotDataEpisode;
  set snapShotDataEpisode(SnapshotData<Episode?> value) {
    _snapShotDataEpisode = value;
    notifyListeners();
  }

  void fetchEpisode(String url) async {
    snapShotDataEpisode = snapShotDataEpisode.copyWith(
      isLoading: true,
      error: null,
    );

    dynamic errorWhenFetchCharacters;
    Episode? episode;
    try {
      episode = await _episodesUseCase.getEpisode(url: url);
      _snapShotDataEpisode.copyWith(
        data: episode,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      errorWhenFetchCharacters = e;
      episode = null;
    }
  }
}
