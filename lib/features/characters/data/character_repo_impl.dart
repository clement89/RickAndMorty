import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/models/app_error.dart';
import 'package:rick_morty/core/networking/rest_service.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/features/characters/domain/character_repo.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({required this.restService});
  final RestService restService;
  @override
  Future<Either<AppError, List<Character>>> getAllCharacters() async {
    try {
      final res = await restService.getDataFromServer(
        url: 'character',
        header: {},
      );
      if (res.isError) {
        return const Left(
            AppError(message: 'Failed to get characters from server'));
      } else {
        List<dynamic> characterData = res.data['results'];
        List<Character> characters = [];

        for (int i = 0; i < characterData.length; i++) {
          Map<String, dynamic>? characterItem = characterData[i];
          if (characterItem != null) {
            Character character = Character.fromJson(characterItem);
            if (character != Character.empty()) {
              characters.add(character);
            }
          }
        }
        return Future.value(Right(characters));
      }
    } catch (e) {
      return const Left(
          AppError(message: 'Failed to get characters from server'));
    }
  }
}
