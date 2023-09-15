import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/core/models/app_error.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/features/characters/domain/character_repo.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({required this.characterRepository})
      : super(CharacterState.initial()) {
    on<LoadCharacters>(_fetchPosts);
  }
  final CharacterRepository characterRepository;

  Future<void> _fetchPosts(
    LoadCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));
      final res = await characterRepository.getAllCharacters();
      res.fold(
        (l) => emit(state.copyWith(status: Status.error, error: l)),
        (r) => emit(
          state.copyWith(
            characterList: r,
            status: Status.loaded,
            error: AppError.empty(),
          ),
        ),
      );
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
        error: const AppError(message: 'Unable to load characters'),
      ));
    }
  }
}
