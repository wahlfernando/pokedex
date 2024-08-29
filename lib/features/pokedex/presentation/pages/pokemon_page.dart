import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/pokemon_store.dart';
import '../widgets/pokemon_list_widget.dart';
import '../widgets/pokemon_search_widget.dart';

class PokemonPage extends StatelessWidget {
  final PokemonStore store;

  const PokemonPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: store.loadPokemonList,
          ),
        ],
      ),
      body: Column(
        children: [
          PokemonSearchWidget(store: store),
          Expanded(
            child: Observer(
              builder: (_) {
                if (store.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (store.errorMessage != null) {
                  return Center(child: Text(store.errorMessage!));
                } else {
                  return PokemonListWidget(pokemonList: store.pokemonList);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
