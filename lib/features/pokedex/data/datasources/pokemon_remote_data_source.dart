import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final response = await client.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = json.decode(response.body)['results'];
      return decodedJson.map((json) => PokemonModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
