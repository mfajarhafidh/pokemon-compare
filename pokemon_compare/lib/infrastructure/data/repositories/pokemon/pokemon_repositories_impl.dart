import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/entities/pokemon_color/pokemon_color_model.dart';
import 'package:pokemon_compare/domain/repositories/pokemon/pokemon_repositories.dart';
import 'package:pokemon_compare/infrastructure/data/data_sources/remote/pokemon/remote_pokemon_data_source.dart';

class PokemonRepositoriesImpl implements PokemonRepositories {
  final RemotePokemonDataSource _remotePokemonDataSource;

  PokemonRepositoriesImpl(this._remotePokemonDataSource);

  @override
  Future<PokemonGeneralModel> getPokemonGeneral({required int pokemon}) {
    return _remotePokemonDataSource.getPokemonGeneral(pokemon: pokemon);
  }

  @override
  Future<PokemonColorModel> getPokemonColor({required int pokemon}) {
    return _remotePokemonDataSource.getPokemonColor(pokemon: pokemon);
  }
}
