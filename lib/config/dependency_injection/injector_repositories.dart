part of 'injector.dart';

class _InjectorRepositories {
  _InjectorRepositories() {
    Injector.register<CharactersRepository>(instanceName: 'http_characters_repository', () {
      return const HttpCharactersRepository();
    });

    Injector.register<CharactersRepository>(instanceName: 'dio_characters_repository', () {
      return const DioCharactersRepository();
    });
  }
}
