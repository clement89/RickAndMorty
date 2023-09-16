import 'package:hive/hive.dart';

part 'character_origin.g.dart';

@HiveType(
    typeId:
        1) // Use a different typeId (e.g., 1) to distinguish it from the Character class
class CharacterOrigin extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  CharacterOrigin({
    required this.name,
    required this.url,
  });
}
