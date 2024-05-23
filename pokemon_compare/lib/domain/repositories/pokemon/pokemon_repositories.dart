import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/entities/pokemon_color/pokemon_color_model.dart';

abstract class PokemonRepositories {
  Future<PokemonGeneralModel> getPokemonGeneral({required int pokemon});
  Future<PokemonColorModel> getPokemonColor({required int pokemon});
}
