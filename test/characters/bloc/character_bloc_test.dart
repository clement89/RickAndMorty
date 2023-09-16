import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:rick_morty/core/storage/storage_service.dart';
import 'package:rick_morty/features/characters/domain/character_repo.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

class MockStorageService extends Mock implements StorageService {}

void main() {
  late CharacterRepository repo;
  late StorageService storage;

  setUp(() {
    repo = MockCharacterRepository();
    storage = MockStorageService();
  });

  group('LoadCharacters', () {
    blocTest<CharacterBloc, CharacterState>(
      'emits [MyState] '
      'when [LoadCharacters] is added.',
      setUp: () {
        when(
          () => repo.getAllCharacters(),
        ).thenAnswer((invocation) async => const Right([]));
      },
      build: () => CharacterBloc(
        characterRepository: repo,
        storageService: storage,
      ),
      act: (bloc) => bloc.add(LoadCharacters()),
      verify: (bloc) {
        verify(
          () => repo.getAllCharacters(),
        ).called(1);
      },
      expect: () => <CharacterState>[
        CharacterState.initial().copyWith(
          status: Status.loading,
        ),
        CharacterState.initial().copyWith(
          status: Status.loaded,
        ),
      ],
    );
  });
}
