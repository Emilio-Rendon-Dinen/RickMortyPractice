import 'package:flutter/material.dart';
import 'package:rick_morty_practice/src/domain/use_cases/characters_use_case.dart';

class CharactersNotifier extends ChangeNotifier {
  final CharactersUseCase _charactersUseCase;

  CharactersNotifier({
    required CharactersUseCase charactersUseCase,
  }) : _charactersUseCase = charactersUseCase;
}
