import 'package:get_it/get_it.dart';
import 'package:rick_morty/core/logs/log_service.dart';
import 'package:rick_morty/core/networking/rest_service.dart';
import 'package:rick_morty/core/storage/storage_service.dart';
import 'package:rick_morty/features/characters/data/character_repo_impl.dart';
import 'package:rick_morty/features/characters/domain/character_repo.dart';

final serviceLocator = GetIt.instance;

Future<void> setupInjection() async {
  serviceLocator
    ..registerLazySingleton<LogService>(() => LogService())
    ..registerLazySingleton<StorageService>(() => StorageService())
    ..registerLazySingleton<RestService>(() => RestService())
    ..registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(
        restService: serviceLocator(),
      ),
    );
  ;
}
