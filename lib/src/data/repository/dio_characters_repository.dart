import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/domain/repositories/characters_repository.dart';
import 'package:dio/dio.dart';

class DioCharactersRepository extends CharactersRepository {
  const DioCharactersRepository();

  @override
  Future<List<Character>> getCharaceters({
    required int pageIndex,
  }) async {
    final Uri uri = Uri.parse('https://rickandmortyapi.com/api/character').replace(queryParameters: {
      'page': '$pageIndex',
    });

    final Dio dio = Dio();
    final Response response = await dio.get(uri.toString());

    final dynamic data = response.data;
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

    final Dio dio = Dio();
    final Response response = await dio.get(uri.toString());

    final dynamic data = response.data;
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
