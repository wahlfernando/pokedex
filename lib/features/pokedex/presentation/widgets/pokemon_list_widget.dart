import 'package:flutter/material.dart';
import '../../domain/entities/pokemon.dart';

class PokemonListWidget extends StatelessWidget {
  final List<Pokemon> pokemonList;

  const PokemonListWidget({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];
        return ListTile(
          leading: Image.network(pokemon.imageUrl),
          title: Text(pokemon.name),
        );
      },
    );
  }
}
