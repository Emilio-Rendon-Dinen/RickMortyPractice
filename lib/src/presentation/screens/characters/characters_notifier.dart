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

  SnapshotData<List<Character>> _snapshotSearchCharacters = SnapshotData.initial(data: []);
  SnapshotData<List<Character>> get snapshotSearchCharacters => _snapshotSearchCharacters;
  set snapshotSearchCharacters(SnapshotData<List<Character>> value) {
    _snapshotSearchCharacters = value;
    notifyListeners();
  }

  int _count = 1;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
    fetchCharacters();
  }

  Future<List<Character>> getCharacterBySearch(String name) async {
    snapshotSearchCharacters = snapshotSearchCharacters.copyWith(
      isLoading: true,
      error: null,
    );

    dynamic errorWhenFetchCharacters;
    List<Character> searchCharactersList = [];
    try {
      final List<Character> data = await _charactersUseCase.getCharacterByName(name);
      searchCharactersList = data;
    } catch (e) {
      errorWhenFetchCharacters = e;
      searchCharactersList = [];
    }

    snapshotSearchCharacters = snapshotSearchCharacters.copyWith(
      data: searchCharactersList,
      isLoading: false,
      error: errorWhenFetchCharacters,
    );
    return snapshotSearchCharacters.data;
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
