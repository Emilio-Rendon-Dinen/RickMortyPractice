class Location {
  final String name;
  final String url;

  const Location({
    this.name = '',
    this.url = '',
  });

  static Location? parseToObject(dynamic data) {
    if (data is Map<String, dynamic>) {
      return Location(
        name: data['name'],
        url: data['url'],
      );
    }

    return null;
  }
}
