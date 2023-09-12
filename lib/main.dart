import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
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
    return MaterialApp(
      home: const Scaffold(),
      onGenerateTitle: (_) => '',
    );
  }
}
