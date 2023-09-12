import 'package:rick_morty_practice/src/domain/models/character.dart';

abstract class CharactersRepository {
  const CharactersRepository();

  Future<List<Character>> getCharaceters({
    required int pageIndex,
  });

  Future<Character> getCharacterByName(String characterName);
}
