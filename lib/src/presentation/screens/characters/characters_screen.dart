import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/presentation/models/snapshot_data.dart';
import 'package:rick_morty_practice/src/presentation/screens/characters/characters_notifier.dart';

part 'widgets/characters_widget.dart';
part 'widgets/search_delegate.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharactersNotifier>().fetchCharacters();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rick and Morty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchCharacter());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: _CharactersWidget(
        onTap: (character) {
          context.push('/character', extra: character);
        },
      ),
    );
  }
}
