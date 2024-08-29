import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// Importações dos módulos do seu projeto
import 'core/util/input_converter.dart';
import 'features/pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'features/pokedex/data/repositories/pokemon_repository_impl.dart';
import 'features/pokedex/domain/repositories/pokemon_repository.dart';
import 'features/pokedex/domain/usecases/get_pokemon_list.dart';
import 'features/pokedex/presentation/stores/pokemon_store.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Registrando o Client HTTP
  sl.registerLazySingleton(() => http.Client());

  // Registrando o InputConverter
  sl.registerLazySingleton(() => InputConverter());

  // Registrando o Data Source remoto
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );

  // Registrando o Repositório
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: sl()),
  );

  // Registrando o Use Case
  sl.registerLazySingleton(() => GetPokemonList(sl()));

  // Registrando o Store
  sl.registerFactory(() => PokemonStore(getPokemonList: sl()));
}
