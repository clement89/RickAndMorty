import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/core/models/app_error.dart';
import 'package:rick_morty/core/storage/storage_service.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/features/characters/domain/character_repo.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({
    required this.characterRepository,
    required this.storageService,
  }) : super(CharacterState.initial()) {
    on<LoadCharacters>(_fetchCharacters);
    on<UpdateFilter>(_updateFilter);
    on<ApplyFilter>(_applyFilter);
  }
  final CharacterRepository characterRepository;
  final StorageService storageService;

  Future<void> _fetchCharacters(
    LoadCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));
      final res = await characterRepository.getAllCharacters();
      res.fold(
        (l) {
          // emit(state.copyWith(status: Status.error, error: l));
          emit(
            state.copyWith(
              characterList: storageService.getCharacters() ?? [],
              filteredList: storageService.getCharacters() ?? [],
              status: Status.loaded,
              error: AppError.empty(),
            ),
          );
        },
        (r) {
          if (r.isNotEmpty) {
            storageService.saveCharacters(r);
            emit(
              state.copyWith(
                characterList: r,
                filteredList: r,
                status: Status.loaded,
                error: AppError.empty(),
              ),
            );
          } else {
            emit(
              state.copyWith(
                characterList: storageService.getCharacters() ?? [],
                filteredList: storageService.getCharacters() ?? [],
                status: Status.loaded,
                error: AppError.empty(),
              ),
            );
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
        error: const AppError(message: 'Unable to load characters'),
      ));
    }
  }

  Future<void> _updateFilter(
    UpdateFilter event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      if (event.filter == Filter.name) {
        emit(state.copyWith(
          selectedFilter: Filter.name,
          filterValues: state.characterList
              .map((character) => character.name)
              .toSet()
              .toList(),
        ));
      } else if (event.filter == Filter.status) {
        emit(state.copyWith(
          selectedFilter: Filter.status,
          filterValues: state.characterList
              .map((character) => character.status)
              .toSet()
              .toList(),
        ));
      } else if (event.filter == Filter.species) {
        emit(state.copyWith(
          selectedFilter: Filter.species,
          filterValues: state.characterList
              .map((character) => character.species)
              .toSet()
              .toList(),
        ));
      } else {
        emit(state.copyWith(selectedFilter: Filter.none, filterValues: []));
      }
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
        error: const AppError(message: 'Unable to load characters'),
      ));
    }
  }

  Future<void> _applyFilter(
    ApplyFilter event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      List<Character> list = [];

      if (event.filter == Filter.name) {
        list = state.characterList
            .where((character) => character.name.contains(event.value))
            .toList();
      } else if (event.filter == Filter.status) {
        list = state.characterList
            .where((character) => character.status.contains(event.value))
            .toList();
      } else {
        list = state.characterList
            .where((character) => character.species.contains(event.value))
            .toList();
      }

      emit(state.copyWith(
        filteredList: list,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
        error: const AppError(message: 'Unable to load characters'),
      ));
    }
  }
}
