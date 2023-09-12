import 'package:flutter/material.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/domain/use_cases/characters_use_case.dart';
import 'package:rick_morty_practice/src/presentation/models/snapshot_data.dart';

class CharactersNotifier extends ChangeNotifier {
  final CharactersUseCase _charactersUseCase;

  CharactersNotifier({
    required CharactersUseCase charactersUseCase,
  }) : _charactersUseCase = charactersUseCase;

  SnapshotData<List<Character>> _snapshotCharacters = SnapshotData.initial(data: []);
  SnapshotData<List<Character>> get snapshotCharacters => _snapshotCharacters;
  set snapshotCharacters(SnapshotData<List<Character>> value) {
    _snapshotCharacters = value;
    notifyListeners();
  }

  void fetchCharacters() async {
    snapshotCharacters = snapshotCharacters.copyWith(
      isLoading: true,
      error: null,
    );

    dynamic errorWhenFetchCharacters;
    List<Character> characters;
    try {
      characters = await _charactersUseCase.getCharaceters(pageIndex: 1);
    } catch (e) {
      errorWhenFetchCharacters = e;
      characters = [];
    }

    snapshotCharacters = snapshotCharacters.copyWith(
      data: characters,
      isLoading: false,
      error: errorWhenFetchCharacters,
    );
  }
}
