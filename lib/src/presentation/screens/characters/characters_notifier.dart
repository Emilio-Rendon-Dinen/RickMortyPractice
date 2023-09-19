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

  SnapshotData<Character?> _snapshotCharacter = SnapshotData.initial(data: null);
  SnapshotData<Character?> get snapshotCharacter => _snapshotCharacter;
  set snapshotCharacter(SnapshotData<Character?> value) {
    _snapshotCharacter = value;
    notifyListeners();
  }

  int _count = 1;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
    fetchCharacters();
  }

  Future getCharacter(String name) async {
    snapshotCharacter = snapshotCharacter.copyWith(
      isLoading: true,
      error: null,
    );

    dynamic errorWhenFetchCharacters;
    Character? character;
    try {
      character = await _charactersUseCase.getCharacterByName(name);
    } catch (e) {
      errorWhenFetchCharacters = e;
      character = null;
    }

    snapshotCharacters = snapshotCharacters.copyWith(
      isLoading: false,
      error: errorWhenFetchCharacters,
    );
  }

  void fetchCharacters() async {
    snapshotCharacters = snapshotCharacters.copyWith(
      isLoading: true,
      error: null,
    );

    dynamic errorWhenFetchCharacters;
    List<Character> characters;
    try {
      characters = await _charactersUseCase.getCharaceters(pageIndex: count);
      snapshotCharacters.data.addAll(characters);
    } catch (e) {
      errorWhenFetchCharacters = e;
      characters = [];
    }

    snapshotCharacters = snapshotCharacters.copyWith(
      isLoading: false,
      error: errorWhenFetchCharacters,
    );
  }
}
