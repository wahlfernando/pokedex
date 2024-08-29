import 'package:flutter/material.dart';
import '../stores/pokemon_store.dart';

class PokemonSearchWidget extends StatelessWidget {
  final PokemonStore store;

  const PokemonSearchWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          store.pokemonList.clear();
          store.loadPokemonList();
        },
        decoration: InputDecoration(
          hintText: 'Search Pokémon...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
