import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/models/app_error.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

abstract class CharacterRepository {
  Future<Either<AppError, List<Character>>> getAllCharacters(
      {required int page});
}
