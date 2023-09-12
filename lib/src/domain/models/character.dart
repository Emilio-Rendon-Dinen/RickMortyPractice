import 'package:rick_morty_practice/src/domain/models/location.dart';
import 'package:rick_morty_practice/src/domain/models/origin.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin? origin;
  final Location? location;
  final String image;
  final List<String>? episodes;
  final String url;
  final String created;

  const Character({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin,
    this.location,
    this.image = '',
    this.episodes,
    this.url = '',
    this.created = '',
  });

  static Character? parseToObject(dynamic data) {
    if (data is Map<String, dynamic>) {
      return Character(
        id: data['id'],
        name: data['name'],
        status: data['status'],
        species: data['species'],
        type: data['type'],
        gender: data['gender'],
        origin: Origin.parseToObject(data['origin']),
        location: Location.parseToObject(data['location']),
        image: data['image'],
        episodes: data['episode'] == null ? [] : List<String>.from(data['episode']!.map((x) => x)),
        url: data['url'],
        created: data['created'],
      );
    }
    return null;
  }

  static List<Character>? parseToList(dynamic data) {
    if (data is List) {
      final List<Character> characters = [];

      for (var item in data) {
        final Character? character = parseToObject(item);
        if (character != null) {
          characters.add(character);
        }
      }

      return characters;
    }

    return null;
  }
}
