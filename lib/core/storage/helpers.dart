import 'package:rick_morty/core/storage/models/character.dart';
import 'package:rick_morty/core/storage/models/character_location.dart';
import 'package:rick_morty/core/storage/models/character_origin.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

class StorageHelpers {
  // Method to convert CharacterHive to Character
  static Character convertToCharacter(CharacterHive hiveModel) {
    return Character(
      id: hiveModel.id,
      name: hiveModel.name,
      status: hiveModel.status,
      species: hiveModel.species,
      type: hiveModel.type,
      gender: hiveModel.gender,
      origin: _convertToCharacterOrigin(hiveModel.origin),
      location: _convertToCharacterLocation(hiveModel.location),
      image: hiveModel.image,
      episode: hiveModel.episode,
      url: hiveModel.url,
      created: hiveModel.created,
    );
  }

  // Method to convert CharacterOriginHive to CharacterOrigin
  static CharacterOrigin _convertToCharacterOrigin(
      CharacterOriginHive hiveModel) {
    return CharacterOrigin(
      name: hiveModel.name,
      url: hiveModel.url,
    );
  }

  // Method to convert CharacterLocationHive to CharacterLocation
  static CharacterLocation _convertToCharacterLocation(
      CharacterLocationHive hiveModel) {
    return CharacterLocation(
      name: hiveModel.name,
      url: hiveModel.url,
    );
  }

  // Method to convert Character to Hive model
  static CharacterHive convertToHiveModel(Character character) {
    return CharacterHive(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        type: character.type,
        gender: character.gender,
        origin: _convertToHiveModel1(character.origin),
        location: _convertToHiveModel2(character.location),
        image: character.image,
        episode: character.episode,
        url: character.url,
        created: character.created);
  }

  static CharacterOriginHive _convertToHiveModel1(CharacterOrigin model) {
    return CharacterOriginHive(name: model.name, url: model.url);
  }

  static CharacterLocationHive _convertToHiveModel2(CharacterLocation model) {
    return CharacterLocationHive(name: model.name, url: model.url);
  }
}
