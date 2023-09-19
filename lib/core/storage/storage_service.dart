import 'package:hive/hive.dart';
import 'package:rick_morty/core/storage/helpers.dart';
import 'package:rick_morty/core/storage/models/character.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

class StorageService {
  Box<CharacterHive>? _characterBox;

  Future<void> openHiveBoxes() async {
    // Open the Hive box for characters
    _characterBox = await Hive.openBox<CharacterHive>('characters');
  }

  Future<void> closeHiveBoxes() async {
    // Close the Hive boxes to release resources
    await _characterBox?.close();
  }

  Future<void> saveCharacters(List<Character> characters) async {
    // Ensure the character box is open
    if (_characterBox == null) {
      throw Exception('Character box is not open.');
    }

    for (final character in characters) {
      CharacterHive? existingCharacter = _characterBox!.values
          .cast<CharacterHive?>()
          .firstWhere((hiveCharacter) => hiveCharacter!.id == character.id,
              orElse: () => null);

      if (existingCharacter != null) {
        // await _characterBox!.put(existingCharacter.key, StorageHelpers.convertToHiveModel(character));
      } else {
        await _characterBox!.add(StorageHelpers.convertToHiveModel(character));
      }
    }
  }

  List<Character>? getCharacters() {
    try {
      // Ensure the character box is open
      if (_characterBox == null) {
        throw Exception('Character box is not open.');
      }

      // Retrieve all characters from the box
      List<CharacterHive> list = _characterBox!.values.toList();
      List<Character>? chatList = list
          .map((hiveModel) => StorageHelpers.convertToCharacter(hiveModel))
          .toList();
      return chatList ?? [];
    } catch (e) {
      return [];
    }
  }

  void clearCharacters() {
    // Ensure the character box is open
    if (_characterBox == null) {
      throw Exception('Character box is not open.');
    }

    // Clear all characters from the box
    _characterBox!.clear();
  }
}
