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

  int _count = 1;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
    fetchCharacters();
  }

  // void getCharacter (String name) async {
  //    snapshotCharacters = snapshotCharacters.copyWith(
  //     isLoading: true,
  //     error: null,
  //   );

  //   dynamic errorWhenFetchCharacters;
  //   List<Character> characters;
  //   try {
  //     characters = await _charactersUseCase.getCharacterByName(name);
  //     snapshotCharacters.data.addAll(characters);
  //   } catch (e) {
  //     errorWhenFetchCharacters = e;
  //     characters = [];
  //   }

  //   snapshotCharacters = snapshotCharacters.copyWith(
  //     isLoading: false,
  //     error: errorWhenFetchCharacters,
  //   );
  // }

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
