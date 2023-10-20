import 'dart:convert';

import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/domain/repositories/characters_repository.dart';
import 'package:http/http.dart' as http;

class HttpCharactersRepository extends CharactersRepository {
  const HttpCharactersRepository();

  @override
  Future<List<Character>> getCharaceters({
    required int pageIndex,
  }) async {
    final Uri uri = Uri.parse('https://rickandmortyapi.com/api/character').replace(queryParameters: {
      'page': '$pageIndex',
    });

    final http.Response response = await http.get(uri);
    final dynamic data = jsonDecode(response.body);
    if (data is! Map) {
      throw 'unexpected_data';
    }

    final List<Character>? characters = Character.parseToList(data['results']);
    if (characters == null) {
      throw 'unparsed_data';
    }

    return characters;
  }

  @override
  Future<List<Character>> getCharacterByName(String characterName) async {
    final Uri uri = Uri.parse('https://rickandmortyapi.com/api/character').replace(queryParameters: {
      'name': characterName,
    });

    final http.Response response = await http.get(uri);
    final dynamic data = jsonDecode(response.body);
    if (data is! Map) {
      throw 'unexpected_data';
    }

    final List<Character>? characters = Character.parseToList(data['results']);
    if (characters == null) {
      throw 'unparsed_data';
    }

    return characters;
  }
}
