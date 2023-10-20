part of '../characters_screen.dart';

class SearchCharacter extends SearchDelegate {
  final CharactersNotifier notifier;

  SearchCharacter({required this.notifier});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return circleLoading();
    }
    return FutureBuilder<List<Character>>(
        future: notifier.getCharacterBySearch(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circleLoading();
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                final character = snapshot.data![index];
                return ListTile(
                  title: Text(character.name),
                  leading: Hero(
                    tag: character.id,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(character.image),
                    ),
                  ),
                  onTap: () {
                    context.push('/character', extra: character);
                  },
                );
              }));
        });
  }
}

Widget circleLoading() {
  return const Center(
    child: CircleAvatar(
      radius: 100,
      backgroundImage: AssetImage('assets/images/portalgif.gif'),
    ),
  );
}
