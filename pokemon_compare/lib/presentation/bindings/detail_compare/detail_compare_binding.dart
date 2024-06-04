import 'package:get/get.dart';
import 'package:pokemon_compare/domain/repositories/pokemon/pokemon_repositories.dart';
import 'package:pokemon_compare/domain/use_case/evolution/get_evolution_use_case.dart';
import 'package:pokemon_compare/domain/use_case/pokemon_color/get_pokemon_color_use_case.dart';
import 'package:pokemon_compare/domain/use_case/pokemon_general/get_pokemon_general_use_case.dart';
import 'package:pokemon_compare/infrastructure/data/data_sources/remote/pokemon/remote_pokemon_data_source.dart';
import 'package:pokemon_compare/infrastructure/data/repositories/pokemon/pokemon_repositories_impl.dart';
import 'package:pokemon_compare/presentation/controllers/detail_compare/detail_compare_controller.dart';

class DetailCompareBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemotePokemonDataSource>(
        () => RemotePokemonDataSource(httpClient: Get.find<GetConnect>()));
    Get.lazyPut<PokemonRepositories>(
        () => PokemonRepositoriesImpl(Get.find<RemotePokemonDataSource>()));

    Get.lazyPut<GetPokemonGeneralUseCase>(
        () => GetPokemonGeneralUseCase(Get.find<PokemonRepositories>()));
    Get.lazyPut<GetPokemonColorUseCase>(
        () => GetPokemonColorUseCase(Get.find<PokemonRepositories>()));
    Get.lazyPut<GetEvolutionUseCase>(
        () => GetEvolutionUseCase(Get.find<PokemonRepositories>()));

    Get.lazyPut<DetailCompareController>(() => DetailCompareController(
          Get.find<GetPokemonGeneralUseCase>(),
          Get.find<GetEvolutionUseCase>(),
        ));
  }
}
