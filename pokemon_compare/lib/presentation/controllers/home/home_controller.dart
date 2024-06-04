import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/use_case/pokemon_general/get_pokemon_general_use_case.dart';

class HomeController extends GetxController {
  final GetPokemonGeneralUseCase _getPokemonGeneralUseCase;

  HomeController(this._getPokemonGeneralUseCase);

  RxList<String> pokemonNameList = <String>[].obs;
  RxList<String> pokemonTypeList = <String>[].obs;
  RxList<String> pokemonTypeList2 = <String>[].obs;
  RxList<OfficialArtwork> pokemonImageList = <OfficialArtwork>[].obs;
  RxList<String> pokemonIdList = <String>[].obs;
  RxBool isLoading = false.obs;

  RxString namePokemonChosen = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getPokemonSpecies();
  }

  Future<void> getPokemonSpecies() async {
    isLoading.toggle();
    try {
      for (var i = 1; i < 50; i++) {
        final response = await _getPokemonGeneralUseCase.call(pokemon: i);
        pokemonNameList.add(response.name!);

        if (response.types!.length == 2) {
          pokemonTypeList.add(response.types![0].type!.name!);
          pokemonTypeList2.add(response.types![1].type!.name!);
        } else {
          pokemonTypeList.add(response.types![0].type!.name!);
          pokemonTypeList2.add('');
        }

        pokemonImageList.add(response.sprites!.other!.officialArtwork!);

        if (response.id! > 0 && response.id! <= 9) {
          pokemonIdList.add('00${response.id!.toString()}');
        } else if (response.id! >= 10 && response.id! <= 99) {
          pokemonIdList.add('0${response.id!.toString()}');
        } else {
          pokemonIdList.add(response.id!.toString());
        }
      }

      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }
}
