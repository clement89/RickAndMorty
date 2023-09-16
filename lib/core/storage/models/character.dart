import 'package:hive/hive.dart';
import 'package:rick_morty/core/storage/models/character_location.dart';
import 'package:rick_morty/core/storage/models/character_origin.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
class CharacterHive extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final CharacterOriginHive origin;

  @HiveField(7)
  final CharacterLocationHive location;

  @HiveField(8)
  final String image;

  @HiveField(9)
  final List<String> episode;

  @HiveField(10)
  final String url;

  @HiveField(11)
  final String created;

  CharacterHive({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}
