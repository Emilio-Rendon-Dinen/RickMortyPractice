import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/presentation/models/snapshot_data.dart';
import 'package:rick_morty_practice/src/presentation/screens/characters/characters_notifier.dart';

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
    SnapshotData<List<Character>> snapshotCharacters = context.select<CharactersNotifier, SnapshotData<List<Character>>>((notifier) => notifier.snapshotCharacters);

    circleLoading();

    if (query.isEmpty) {
      return circleLoading();
    }
    return FutureBuilder(
      future: characterProvider.getCharacter(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Column(
            children: [
              circleLoading(),
              const Text('no hay datos'),
            ],
          );
        }
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final character = snapshot.data![index];
              return ListTile(
                onTap: () {
                  context.go('/character', extra: character);
                },
                title: Text(character.name),
                leading: Hero(
                  tag: character.id,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(character.image),
                  ),
                ),
              );
            });
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
