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
    on<CharacterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final CharacterRepository characterRepository;
}
