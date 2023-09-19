part of 'character_bloc.dart';

@immutable
class CharacterState extends Equatable {
  final Status status;
  final List<Character> characterList;
  final List<Character> filteredList;
  final Filter selectedFilter;
  final List<String> filterValues;
  final String selectedFilterValue;
  final int page;
  final AppError error;

  const CharacterState({
    required this.status,
    required this.characterList,
    required this.filteredList,
    required this.selectedFilter,
    required this.filterValues,
    required this.selectedFilterValue,
    required this.error,
    required this.page,
  });

  factory CharacterState.initial() {
    return CharacterState(
      status: Status.initial,
      characterList: const [],
      filteredList: const [],
      selectedFilter: Filter.none,
      filterValues: const [],
      selectedFilterValue: '',
      error: AppError.empty(),
      page: 1,
    );
  }

  CharacterState copyWith({
    List<Character>? characterList,
    List<Character>? filteredList,
    AppError? error,
    Status? status,
    Filter? selectedFilter,
    String? selectedFilterValue,
    List<String>? filterValues,
    int? page,
  }) {
    return CharacterState(
      characterList: characterList ?? this.characterList,
      filteredList: filteredList ?? this.filteredList,
      error: error ?? this.error,
      status: status ?? this.status,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedFilterValue: selectedFilterValue ?? this.selectedFilterValue,
      filterValues: filterValues ?? this.filterValues,
      page: page ?? this.page,
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
        selectedFilterValue,
        page,
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
