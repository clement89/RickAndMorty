import 'package:hive/hive.dart';

part 'character_location.g.dart';

@HiveType(
    typeId:
        2) // Use a different typeId (e.g., 2) to distinguish it from the Character class
class CharacterLocationHive extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  CharacterLocationHive({
    required this.name,
    required this.url,
  });
}
