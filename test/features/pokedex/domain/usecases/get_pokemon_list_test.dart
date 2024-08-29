import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterpokedex/core/error/failures.dart';
import 'package:flutterpokedex/core/usecases/usecase.dart';
import 'package:flutterpokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:flutterpokedex/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:flutterpokedex/features/pokedex/domain/usecases/get_pokemon_list.dart';
import 'package:mockito/mockito.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}


void main() {
  late GetPokemonList usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonList(mockPokemonRepository);
  });

  final tPokemonList = [
    Pokemon(name: 'Pikachu', id: 25, imageUrl: 'https://example.com/pikachu.png'),
    Pokemon(name: 'Charmander', id: 4, imageUrl: 'https://example.com/charmander.png'),
  ];

  test('deve retornar uma lista de Pokémons do repositório', () async {
    when(mockPokemonRepository.getPokemonList())
        .thenAnswer((_) async => Right(tPokemonList));
    
    final result = await usecase(NoParams());
    
    expect(result, Right(tPokemonList));
    verify(mockPokemonRepository.getPokemonList());
    verifyNoMoreInteractions(mockPokemonRepository);
  });

  test('deve retornar uma falha quando o repositório falha', () async {
    when(mockPokemonRepository.getPokemonList())
        .thenAnswer((_) async => Left(ServerFailure('')));
    
    final result = await usecase(NoParams());
    
    expect(result, Left(ServerFailure('')));
    verify(mockPokemonRepository.getPokemonList());
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
