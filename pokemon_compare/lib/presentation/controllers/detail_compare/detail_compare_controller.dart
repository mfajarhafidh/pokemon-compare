import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/use_case/evolution/get_evolution_use_case.dart';
import 'package:pokemon_compare/domain/use_case/pokemon_general/get_pokemon_general_use_case.dart';

class DetailCompareController extends GetxController {
  final GetPokemonGeneralUseCase _getPokemonGeneralUseCase;
  final GetEvolutionUseCase _getEvolutionUseCase;

  DetailCompareController(
      this._getPokemonGeneralUseCase, this._getEvolutionUseCase);

  RxBool isLoading = false.obs;
  RxString namePokemonChosen = ''.obs;

  RxList<String> pokemonName = <String>[].obs;
  RxList<String> pokemonType = <String>[].obs;
  RxList<String> pokemonType2 = <String>[].obs;
  RxList<OfficialArtwork> pokemonImage = <OfficialArtwork>[].obs;
  RxList<String> pokemonId = <String>[].obs;
  RxList<String> pokemonHeight = <String>[].obs;
  RxList<String> pokemonWeight = <String>[].obs;

  RxList pokemonAbilities = [].obs;
  RxList pokemonStats = [].obs;
  RxList pokemonBaseStats = [].obs;

  RxList pokemonAbilitiesName = [].obs;

  RxString pokemonMove = ''.obs;
  RxString pokemonSpecies = ''.obs;

  late PageController pageController;

  RxInt selectedPage = 0.obs;

  RxInt indexId = 0.obs;

  @override
  void onInit() {
    super.onInit();

    pageController = PageController(initialPage: 0);
    var args = Get.arguments;
    if (args != null) {
      indexId.value = args[0];
      selectedPokemon(indexId.value);
    }
  }

  void selectedPokemon(int id) async {
    namePokemonChosen.value = id.toString();

    pokemonName.clear();
    pokemonType.clear();
    pokemonImage.clear();
    pokemonId.clear();
    pokemonHeight.clear();
    pokemonWeight.clear();
    pokemonAbilities.clear();
    pokemonStats.clear();
    pokemonBaseStats.clear();
    isLoading.toggle();
    pokemonAbilitiesName.clear();
    pokemonSpecies.value = '';
    pokemonMove.value = '';

    try {
      final response = await _getPokemonGeneralUseCase.call(pokemon: id);

      pokemonName.add(response.name!);

      pokemonHeight.add(response.height!.toString());
      pokemonWeight.add(response.weight!.toString());

      if (response.types!.length == 2) {
        pokemonType.add(response.types![0].type!.name!);
        pokemonType2.add(response.types![1].type!.name!);
      } else {
        pokemonType.add(response.types![0].type!.name!);
        pokemonType2.add('');
      }

      pokemonImage.add(response.sprites!.other!.officialArtwork!);

      if (response.id! > 0 && response.id! <= 9) {
        pokemonId.add('00${response.id!.toString()}');
      } else if (response.id! >= 10 && response.id! <= 99) {
        pokemonId.add('0${response.id!.toString()}');
      } else {
        pokemonId.add(response.id!.toString());
      }

      pokemonAbilities.add(response.abilities);

      for (var i in pokemonAbilities) {
        for (var x in i) {
          pokemonAbilitiesName.add(x.ability.name);
        }
      }

      pokemonMove.value = response.moves!
          .map((element) =>
              element.move!.name![0].toUpperCase() +
              element.move!.name!.substring(1))
          .join(', ');

      pokemonSpecies.value = response.species!.name!;

      pokemonStats.addAll(response.stats!.map((e) => e.stat!.name!));
      pokemonBaseStats.addAll(response.stats!.map((e) => e.baseStat!));

      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }

  void getEvolution(int id) async {
    try {
      final response = await _getEvolutionUseCase.call(pokemon: id);

      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }

  Color colorProgress({required double progress}) {
    if (progress <= 0.5) {
      return Colors.red;
    } else if (progress <= 0.6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
