import 'package:get_it/get_it.dart';
import 'package:rick_morty/core/logs/log_service.dart';
import 'package:rick_morty/core/networking/rest_service.dart';

final serviceLocator = GetIt.instance;

Future<void> setupInjection() async {
  serviceLocator
    ..registerLazySingleton<LogService>(() => LogService())
    ..registerLazySingleton<RestService>(() => RestService());
}
