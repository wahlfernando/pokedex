import 'package:flutter_test/flutter_test.dart';
import 'package:flutterpokedex/core/error/exceptions.dart';
import 'package:flutterpokedex/core/error/failures.dart';
import 'package:flutterpokedex/features/pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:flutterpokedex/features/pokedex/data/models/pokemon_model.dart';
import 'package:flutterpokedex/features/pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:flutterpokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';

import 'pokemon_repository_impl_test.mocks.dart';


@GenerateMocks([PokemonRemoteDataSource])
void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  final tPokemonModelList = [
    PokemonModel(name: 'Pikachu', id: 25, imageUrl: 'https://example.com/pikachu.png'),
    PokemonModel(name: 'Charmander', id: 4, imageUrl: 'https://example.com/charmander.png'),
  ];

  final List<Pokemon> tPokemonList = tPokemonModelList;

  test('deve retornar dados remotos quando a chamada ao data source for bem-sucedida', () async {
    when(mockRemoteDataSource.getPokemonList())
        .thenAnswer((_) async => tPokemonModelList);
    
    final result = await repository.getPokemonList();
    
    verify(mockRemoteDataSource.getPokemonList());
    expect(result, Right(tPokemonList));
  });

  test('deve retornar uma falha quando a chamada ao data source for malsucedida', () async {
    when(mockRemoteDataSource.getPokemonList()).thenThrow(ServerException());
    
    final result = await repository.getPokemonList();
    
    verify(mockRemoteDataSource.getPokemonList());
    expect(result, Left(ServerFailure('')));
  });
}
