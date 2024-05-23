import 'package:pokemon_compare/domain/entities/pokemon_color/pokemon_color_model.dart';
import 'package:pokemon_compare/domain/repositories/pokemon/pokemon_repositories.dart';

class GetPokemonColorUseCase {
  final PokemonRepositories _pokemonRepositories;

  GetPokemonColorUseCase(this._pokemonRepositories);

  Future<PokemonColorModel> call({required int pokemon}) {
    return _pokemonRepositories.getPokemonColor(pokemon: pokemon);
  }
}
