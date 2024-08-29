import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/pokemon_remote_data_source.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList() async {
    try {
      final remotePokemonList = await remoteDataSource.getPokemonList();
      log("remotePokemonList: $remotePokemonList");
      return Right(remotePokemonList);
    } on ServerException {
      return Left(ServerFailure('Failed to fetch data from server.'));
    }
  }
}
