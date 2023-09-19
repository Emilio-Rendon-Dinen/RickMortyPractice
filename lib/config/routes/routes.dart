import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_practice/config/dependency_injection/injector.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/presentation/screens/character_info/character_info_notifier.dart';
import 'package:rick_morty_practice/src/presentation/screens/characters/characters_notifier.dart';
import 'package:rick_morty_practice/src/presentation/screens/characters/characters_screen.dart';
import 'package:rick_morty_practice/src/presentation/screens/character_info/character_info_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home_shell');

  static GoRouter getConfig([
    String? initialRoute,
  ]) {
    return GoRouter(
      initialLocation: initialRoute ?? '/',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => CharactersNotifier(
              charactersUseCase: Injector.get(),
            ),
            child: const CharactersScreen(),
          ),
        ),
        GoRoute(
          path: '/character',
          builder: (context, state) {
            final character = state.extra as Character;
            return ChangeNotifierProvider(
              create: (context) => CharacterInfoNotifier(
                episodesUseCase: Injector.get(),
              ),
              child: CharacterInfoScreen(
                character: character,
              ),
            );
          },
        ),
      ],
    );
  }
}
