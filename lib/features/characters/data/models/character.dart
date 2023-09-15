import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOrigin origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
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

  factory Character.fromJson(Map<String, dynamic> json) {
    try {
      return Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: CharacterOrigin.fromJson(json['origin']),
        location: CharacterLocation.fromJson(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode']),
        url: json['url'],
        created: json['created'],
      );
    } catch (e) {
      // Handle parsing error by returning an empty character
      return Character.empty();
    }
  }

  factory Character.empty() {
    return Character(
      id: 0,
      name: '',
      status: '',
      species: '',
      type: '',
      gender: '',
      origin: CharacterOrigin(name: '', url: ''),
      location: CharacterLocation(name: '', url: ''),
      image: '',
      episode: [],
      url: '',
      created: '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
      ];
}

class CharacterOrigin {
  final String name;
  final String url;

  CharacterOrigin({
    required this.name,
    required this.url,
  });

  factory CharacterOrigin.fromJson(Map<String, dynamic> json) {
    return CharacterOrigin(
      name: json['name'],
      url: json['url'],
    );
  }
}

class CharacterLocation {
  final String name;
  final String url;

  CharacterLocation({
    required this.name,
    required this.url,
  });

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json['name'],
      url: json['url'],
    );
  }
}
