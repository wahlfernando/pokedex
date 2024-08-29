import 'package:mobx/mobx.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemon_list.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStore with _$PokemonStore;

abstract class _PokemonStore with Store {
  final GetPokemonList getPokemonList;

  _PokemonStore({required this.getPokemonList});

  @observable
  ObservableList<Pokemon> pokemonList = ObservableList<Pokemon>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> loadPokemonList() async {
    isLoading = true;
    errorMessage = null;

    final result = await getPokemonList(NoParams());

    result.fold(
      (failure) => errorMessage = failure.message,
      (pokemon) => pokemonList.addAll(pokemon),
    );

    isLoading = false;
  }
}
