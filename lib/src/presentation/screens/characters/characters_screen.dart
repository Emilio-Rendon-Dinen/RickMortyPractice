import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/presentation/models/snapshot_data.dart';
import 'package:rick_morty_practice/src/presentation/screens/characters/characters_notifier.dart';

part 'widgets/character_widget.dart';
part 'widgets/characters_widget.dart';

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
        title: const Text('Characters'),
      ),
      body: const _CharactersWidget(),
    );
  }
}
