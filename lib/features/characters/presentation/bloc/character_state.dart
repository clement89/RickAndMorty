part of 'character_bloc.dart';

@immutable
class CharacterState extends Equatable {
  final Status status;
  final List<Character> characterList;
  final AppError error;

  const CharacterState({
    required this.status,
    required this.characterList,
    required this.error,
  });

  factory CharacterState.initial() {
    return CharacterState(
      status: Status.initial,
      characterList: const [],
      error: AppError.empty(),
    );
  }

  CharacterState copyWith({
    List<Character>? characterList,
    AppError? error,
    Status? status,
  }) {
    return CharacterState(
      characterList: characterList ?? this.characterList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, characterList, error];
}

enum Status {
  initial,
  loading,
  loaded,
  error,
  empty,
}
