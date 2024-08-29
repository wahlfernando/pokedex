import 'package:flutter_test/flutter_test.dart';
import 'package:flutterpokedex/core/usecases/usecase.dart';
import 'package:flutterpokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterpokedex/features/pokedex/domain/usecases/get_pokemon_list.dart';
import 'package:flutterpokedex/features/pokedex/presentation/stores/pokemon_store.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class MockGetPokemonList extends Mock implements GetPokemonList {}

void main() {
  late PokemonStore store;
  late MockGetPokemonList mockGetPokemonList;


  setUp(() {
    mockGetPokemonList = MockGetPokemonList();
    store = PokemonStore(getPokemonList: mockGetPokemonList);
  });

  final tPokemonList = [
    Pokemon(name: 'Pikachu', id: 25, imageUrl: 'https://example.com/pikachu.png'),
    Pokemon(name: 'Charmander', id: 4, imageUrl: 'https://example.com/charmander.png'),
  ];

  test('deve inicializar o estado como inicial', () {
    expect(store.isLoading, equals(false));
    expect(store.errorMessage, equals(''));
  });

  test('should update the Pokémon list and change the loading state upon success', () async {
    when(mockGetPokemonList.call(NoParams())).thenAnswer((_) async => Right(tPokemonList));
    
    final future = store.getPokemonList(NoParams());
    
    expect(store.isLoading, equals(true));
    await future;
    expect(store.isLoading, equals(false));
    expect(store.errorMessage, equals(''));
    expect(store.pokemonList, equals(tPokemonList));
  });
}
