part of 'injector.dart';

class _InjectorUseCases {
  _InjectorUseCases() {
    Injector.register<CharactersUseCase>(() {
      return CharactersUseCase(
        charactersRepository: GetIt.instance.get(instanceName: 'http_characters_repository'),
      );
    });

    Injector.register<EpisodesUseCase>(() {
      return EpisodesUseCase(
        episodesRepository: GetIt.instance.get(instanceName: 'http_episode_repository'),
      );
    });
  }
}
