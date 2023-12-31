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
          () => repo.getAllCharacters(page: 1),
        ).thenAnswer((invocation) async => const Right([]));
      },
      build: () => CharacterBloc(
        characterRepository: repo,
        storageService: storage,
      ),
      act: (bloc) => bloc.add(const LoadCharacters(isReload: false)),
      verify: (bloc) {
        verify(
          () => repo.getAllCharacters(page: 1),
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

    blocTest<CharacterBloc, CharacterState>(
      'emits [MyState] '
      'when [UpdateFilter] is added.',
      setUp: () {},
      build: () => CharacterBloc(
        characterRepository: repo,
        storageService: storage,
      ),
      act: (bloc) => bloc.add(const UpdateFilter(filter: Filter.name)),
      verify: (bloc) {},
      expect: () => <CharacterState>[
        CharacterState.initial().copyWith(selectedFilter: Filter.name),
      ],
    );
  });

  blocTest<CharacterBloc, CharacterState>(
    'emits [MyState] '
    'when [ApplyFilter] is added.',
    setUp: () {},
    build: () => CharacterBloc(
      characterRepository: repo,
      storageService: storage,
    ),
    act: (bloc) =>
        bloc.add(const ApplyFilter(filter: Filter.name, value: 'Rick')),
    verify: (bloc) {},
    expect: () => <CharacterState>[
      CharacterState.initial().copyWith(selectedFilter: Filter.name),
    ],
  );
}
