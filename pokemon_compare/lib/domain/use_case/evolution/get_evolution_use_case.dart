import 'package:pokemon_compare/domain/entities/evolution/evolution_model.dart';
import 'package:pokemon_compare/domain/repositories/pokemon/pokemon_repositories.dart';

class GetEvolutionUseCase {
  final PokemonRepositories _pokemonRepositories;

  GetEvolutionUseCase(this._pokemonRepositories);

  Future<EvolutionModel> call({required int pokemon}) {
    return _pokemonRepositories.getEvolution(pokemon: pokemon);
  }
}
