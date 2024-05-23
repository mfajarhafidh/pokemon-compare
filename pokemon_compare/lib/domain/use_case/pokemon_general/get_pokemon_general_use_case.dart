import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/repositories/pokemon/pokemon_repositories.dart';

class GetPokemonGeneralUseCase {
  final PokemonRepositories _pokemonRepositories;

  GetPokemonGeneralUseCase(this._pokemonRepositories);

  Future<PokemonGeneralModel> call({required int pokemon}) {
    return _pokemonRepositories.getPokemonGeneral(pokemon: pokemon);
  }
}
