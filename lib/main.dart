import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty_practice/config/dependency_injection/injector.dart';
import 'package:rick_morty_practice/config/routes/routes.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
      Injector.init();
      runApp(const RickMortyPracticeApp());
    });
  }, (error, stack) {});
}

class RickMortyPracticeApp extends StatelessWidget {
  const RickMortyPracticeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.getConfig(),
      onGenerateTitle: (_) => '',
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
    );
  }
}
