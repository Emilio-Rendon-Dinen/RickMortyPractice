import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rick_morty_practice/src/data/repository/dio_characters_repository.dart';
import 'package:rick_morty_practice/src/data/repository/http_characters_repository.dart';
import 'package:rick_morty_practice/src/data/repository/http_episodes_repository.dart';
import 'package:rick_morty_practice/src/domain/repositories/characters_repository.dart';
import 'package:rick_morty_practice/src/domain/repositories/episodes_repository.dart';
import 'package:rick_morty_practice/src/domain/use_cases/characters_use_case.dart';
import 'package:rick_morty_practice/src/domain/use_cases/episodes_use_case.dart';

part 'injector_repositories.dart';
part 'injector_use_cases.dart';

class Injector {
  static final GetIt _instance = GetIt.instance;
  const Injector._();

  static void init() {
    _InjectorRepositories();
    _InjectorUseCases();
  }

  static void register<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    if (_instance.isRegistered<T>(instanceName: instanceName)) {
      _instance.unregister<T>(instanceName: instanceName);
    }
    _instance.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  static void registerWithParams<T extends Object, P1, P2>(
    T Function(P1 para1, P2 param2) factoryFunc, {
    String? instanceName,
  }) {
    if (_instance.isRegistered<T>(instanceName: instanceName)) {
      _instance.unregister<T>(instanceName: instanceName);
    }
    _instance.registerFactoryParam<T, P1, P2>(factoryFunc, instanceName: instanceName);
  }

  static void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    FutureOr<dynamic> Function(T instance)? dispose,
  }) {
    _instance.registerSingleton<T>(
      instance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: dispose,
    );
  }

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _instance.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }
}
