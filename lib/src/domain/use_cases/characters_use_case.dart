import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/domain/repositories/characters_repository.dart';

class CharactersUseCase {
  final CharactersRepository _charactersRepository;

  const CharactersUseCase({
    required CharactersRepository charactersRepository,
  }) : _charactersRepository = charactersRepository;

  Future<List<Character>> getCharaceters({
    required int pageIndex,
  }) {
    return _charactersRepository.getCharaceters(
      pageIndex: pageIndex,
    );
  }

  Future<List<Character>> getCharacterByName(String characterName) {
    return _charactersRepository.getCharacterByName(characterName);
  }
}
