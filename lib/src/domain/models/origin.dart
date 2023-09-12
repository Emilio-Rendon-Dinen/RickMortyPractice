class Origin {
  final String name;
  final String url;

  const Origin({
    this.name = '',
    this.url = '',
  });

  static Origin? parseToObject(dynamic data) {
    if (data is Map<String, dynamic>) {
      return Origin(
        name: data['name'],
        url: data['url'],
      );
    }

    return null;
  }
}
