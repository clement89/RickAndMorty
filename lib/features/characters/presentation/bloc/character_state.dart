part of 'character_bloc.dart';

@immutable
class CharacterState extends Equatable {
  final Status status;
  final List<Character> characterList;
  final List<Character> filteredList;
  final Filter selectedFilter;
  final List<String> filterValues;
  final AppError error;

  const CharacterState({
    required this.status,
    required this.characterList,
    required this.filteredList,
    required this.selectedFilter,
    required this.filterValues,
    required this.error,
  });

  factory CharacterState.initial() {
    return CharacterState(
      status: Status.initial,
      characterList: const [],
      filteredList: const [],
      selectedFilter: Filter.none,
      filterValues: const [],
      error: AppError.empty(),
    );
  }

  CharacterState copyWith({
    List<Character>? characterList,
    List<Character>? filteredList,
    AppError? error,
    Status? status,
    Filter? selectedFilter,
    List<String>? filterValues,
  }) {
    return CharacterState(
      characterList: characterList ?? this.characterList,
      filteredList: filteredList ?? this.filteredList,
      error: error ?? this.error,
      status: status ?? this.status,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      filterValues: filterValues ?? this.filterValues,
    );
  }

  @override
  List<Object> get props => [
        status,
        characterList,
        filteredList,
        error,
        selectedFilter,
        filterValues,
      ];
}

enum Status {
  initial,
  loading,
  loaded,
  error,
  empty,
}

enum Filter {
  none,
  name,
  status,
  species,
}
