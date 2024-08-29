import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonList implements UseCase<List<Pokemon>, NoParams> {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(NoParams params) async {
    return await repository.getPokemonList();
  }
}
