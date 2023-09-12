class Episode {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final String? created;

  const Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  static Episode? parseToObject(dynamic data) {
    if (data is Map<String, dynamic>) {
      return Episode(
        id: data['id'],
        name: data['name'],
        airDate: data['air_date'],
        episode: data['episode'],
        characters: data['characters'] == null ? [] : List<String>.from(data['characters']!.map((x) => x)),
        url: data['url'],
        created: data['created'],
      );
    }

    return null;
  }
}
