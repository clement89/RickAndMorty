import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty/core/models/app_error.dart';
import 'package:rick_morty/core/networking/rest_service.dart';
import 'package:rick_morty/features/characters/data/character_repo_impl.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

class MockRestService extends Mock implements RestService {}

void main() {
  group('CharacterRepositoryImpl', () {
    late CharacterRepositoryImpl characterRepository;
    late MockRestService mockRestService;

    setUp(() {
      mockRestService = MockRestService();
      characterRepository =
          CharacterRepositoryImpl(restService: mockRestService);
    });

    test('getAllCharacters returns a list of characters', () async {
      // Arrange
      final characterData = [
        {
          "id": 361,
          "name": "Toxic Rick",
          "status": "Dead",
          "species": "Humanoid",
          "type": "Rick's Toxic Side",
          "gender": "Male",
          "origin": {
            "name": "Alien Spa",
            "url": "https://rickandmortyapi.com/api/location/64"
          },
          "location": {
            "name": "Earth",
            "url": "https://rickandmortyapi.com/api/location/20"
          },
          "image": "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
          "episode": ["https://rickandmortyapi.com/api/episode/27"],
          "url": "https://rickandmortyapi.com/api/character/361",
          "created": "2018-01-10T18:20:41.703Z"
        },
      ];
      final mockResponse = {
        'results': characterData,
      };
      when(() =>
              mockRestService.getDataFromServer(url: 'character', header: {}))
          .thenAnswer((_) async => ApiResponse(
                data: mockResponse,
                isError: false,
              ));

      // Act
      final result = await characterRepository.getAllCharacters();

      // Assert
      expect(
        result,
        Right(characterData.map((e) => Character.fromJson(e)).toList()),
      );
    });

    test('getAllCharacters handles errors', () async {
      // Arrange
      when(() =>
              mockRestService.getDataFromServer(url: 'character', header: {}))
          .thenAnswer((_) async => ApiResponse(isError: true, data: {}));

      // Act
      final result = await characterRepository.getAllCharacters();

      // Assert
      expect(
        result,
        const Left(AppError(message: 'Failed to get characters from server')),
      );
    });
  });
}
