part of 'character_bloc.dart';

class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharacterEvent {}

class UpdateFilter extends CharacterEvent {
  final Filter filter;
  const UpdateFilter({
    required this.filter,
  });
}

class ApplyFilter extends CharacterEvent {
  final Filter filter;
  final String value;
  const ApplyFilter({
    required this.filter,
    required this.value,
  });
}
