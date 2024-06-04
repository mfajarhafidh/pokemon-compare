import 'package:get/get_connect/connect.dart';
import 'package:pokemon_compare/domain/entities/evolution/evolution_model.dart';
import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/entities/pokemon_color/pokemon_color_model.dart';
import 'package:pokemon_compare/domain/repositories/pokemon/pokemon_repositories.dart';

class RemotePokemonDataSource implements PokemonRepositories {
  final GetConnect httpClient;

  RemotePokemonDataSource({required this.httpClient});

  @override
  Future<PokemonGeneralModel> getPokemonGeneral({required int pokemon}) async {
    try {
      final response = await httpClient.get(
        'pokemon/$pokemon/',
        decoder: (data) => PokemonGeneralModel.fromJson(data),
      );
      if (response.statusCode == 200) {
        return response.body!;
      } else {
        throw DataSourceException('Error');
      }
    } catch (e) {
      throw DataSourceException('Error');
    }
  }

  @override
  Future<PokemonColorModel> getPokemonColor({required int pokemon}) async {
    try {
      final response = await httpClient.get(
        'pokemon-color/$pokemon/',
        decoder: (data) => PokemonColorModel.fromJson(data),
      );
      if (response.statusCode == 200) {
        return response.body!;
      } else {
        throw DataSourceException('Error');
      }
    } catch (e) {
      throw DataSourceException('Error');
    }
  }

  @override
  Future<EvolutionModel> getEvolution({required int pokemon}) async {
    try {
      final response = await httpClient.get(
        'evolution-chain/$pokemon/',
        decoder: (data) => EvolutionModel.fromJson(data),
      );
      if (response.statusCode == 200) {
        return response.body!;
      } else {
        throw DataSourceException('Error');
      }
    } catch (e) {
      throw DataSourceException('Error');
    }
  }
}

class DataSourceException implements Exception {
  final String message;

  DataSourceException(this.message);
}
