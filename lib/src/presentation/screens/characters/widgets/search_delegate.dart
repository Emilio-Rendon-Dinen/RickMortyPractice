part of '../characters_screen.dart';

class SearchCharacter extends SearchDelegate {
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
    SnapshotData<Character?> snapshotCharacter = context.select<CharactersNotifier, SnapshotData<Character?>>((notifier) => notifier.snapshotCharacter);
    // CharactersNotifier? charactersNotifier;
    circleLoading();

    if (query.isEmpty) {
      return circleLoading();
    }
    return FutureBuilder(
      future: context.read<CharactersNotifier>().getCharacter(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Column(
            children: [
              circleLoading(),
              const Text('no hay datos'),
            ],
          );
        }

        return ListTile(
          onTap: () {
            // context.go('/character', extra: snapshotCharacter);
          },
          title: Text(snapshotCharacter.data!.name),
          leading: Hero(
            tag: snapshotCharacter.data!.id,
            child: CircleAvatar(
              backgroundImage: NetworkImage(snapshotCharacter.data!.image),
            ),
          ),
        );
      },
    );
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
