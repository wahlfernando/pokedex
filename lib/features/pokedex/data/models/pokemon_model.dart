import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required super.id, required super.name, required super.imageUrl});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
    );
  }
}
