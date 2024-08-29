import 'dart:developer';

import 'package:flutter/services.dart';

class PokemonChannel {
  static const platform = MethodChannel('pokedex/native');

  Future<int> getPokemonCount() async {
    try {
      final int count = await platform.invokeMethod('getPokemonCount');
      return count;
    } on PlatformException catch (e) {
      log("Falha ao buscar Pokémon numero: '${e.message}'.");
      return 0;
    }
  }
}
