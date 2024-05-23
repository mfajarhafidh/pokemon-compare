import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_compare/domain/entities/pokemon/pokemon_general_model.dart';
import 'package:pokemon_compare/domain/use_case/pokemon_general/get_pokemon_general_use_case.dart';

class HomeController extends GetxController {
  RxList<String> pokemonNameList = <String>[].obs;
  RxList<String> pokemonTypeList = <String>[].obs;
  RxList<String> pokemonTypeList2 = <String>[].obs;
  RxList<OfficialArtwork> pokemonImageList = <OfficialArtwork>[].obs;
  RxList<String> pokemonIdList = <String>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;

  RxList<String> pokemonColorNameList = <String>[].obs;
  RxList<String> pokemonColorList = <String>[].obs;

  RxString namePokemonChosen = ''.obs;
  RxString namePokemonChosen2 = ''.obs;
  final GetPokemonGeneralUseCase _getPokemonGeneralUseCase;

  HomeController(this._getPokemonGeneralUseCase);

  RxList<String> pokemonName = <String>[].obs;
  RxList<String> pokemonType = <String>[].obs;
  RxList<String> pokemonType2 = <String>[].obs;
  RxList<OfficialArtwork> pokemonImage = <OfficialArtwork>[].obs;
  RxList<String> pokemonId = <String>[].obs;
  RxList<String> pokemonHeight = <String>[].obs;
  RxList<String> pokemonWeight = <String>[].obs;

  RxList pokemonSpecies = [].obs;
  RxList pokemonAbilities = [].obs;
  RxList pokemonHP = [].obs;
  RxList pokemonAttack = [].obs;
  RxList pokemonDefense = [].obs;
  RxList pokemonSPAttack = [].obs;
  RxList pokemonSPDefense = [].obs;
  RxList pokemonAbilitiesName = [].obs;

  RxList<String> pokemonName2 = <String>[].obs;
  RxList<String> pokemonType22 = <String>[].obs;
  RxList<String> pokemonType4 = <String>[].obs;
  RxList<OfficialArtwork> pokemonImage2 = <OfficialArtwork>[].obs;
  RxList<String> pokemonId2 = <String>[].obs;
  RxList<String> pokemonHeight2 = <String>[].obs;
  RxList<String> pokemonWeight2 = <String>[].obs;

  RxList pokemonSpecies2 = [].obs;
  RxList pokemonAbilities2 = [].obs;
  RxList pokemonHP2 = [].obs;
  RxList pokemonAttack2 = [].obs;
  RxList pokemonDefense2 = [].obs;
  RxList pokemonSPAttack2 = [].obs;
  RxList pokemonSPDefense2 = [].obs;
  RxList pokemonAbilitiesName2 = [].obs;

  late PageController pageController;

  RxInt selectedPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getPokemonSpecies();
    // getPokemonColor();
    pageController = PageController(initialPage: 0);
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

  void selectedPokemon(int id) async {
    namePokemonChosen.value = id.toString();

    pokemonName.clear();
    pokemonType.clear();
    pokemonImage.clear();
    pokemonId.clear();
    pokemonSpecies.clear();
    pokemonHeight.clear();
    pokemonWeight.clear();
    pokemonAbilities.clear();
    pokemonHP.clear();
    pokemonAttack.clear();
    pokemonDefense.clear();
    pokemonSPAttack.clear();
    pokemonSPDefense.clear();
    isLoading.toggle();
    pokemonAbilitiesName.clear();

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
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
    }
  }

  void selectedPokemon2(int id) async {
    namePokemonChosen2.value = id.toString();

    pokemonName2.clear();
    pokemonType22.clear();
    pokemonImage2.clear();
    pokemonId2.clear();
    pokemonSpecies2.clear();
    pokemonHeight2.clear();
    pokemonWeight2.clear();
    pokemonAbilities2.clear();
    pokemonHP2.clear();
    pokemonAttack2.clear();
    pokemonDefense2.clear();
    pokemonSPAttack2.clear();
    pokemonSPDefense2.clear();
    isLoading2.toggle();
    pokemonAbilitiesName2.clear();

    try {
      final response = await _getPokemonGeneralUseCase.call(pokemon: id);

      pokemonName2.add(response.name!);

      pokemonHeight2.add(response.height!.toString());
      pokemonWeight2.add(response.weight!.toString());

      if (response.types!.length == 2) {
        pokemonType22.add(response.types![0].type!.name!);
        pokemonType4.add(response.types![1].type!.name!);
      } else {
        pokemonType22.add(response.types![0].type!.name!);
        pokemonType4.add('');
      }

      pokemonImage2.add(response.sprites!.other!.officialArtwork!);

      if (response.id! > 0 && response.id! <= 9) {
        pokemonId2.add('00${response.id!.toString()}');
      } else if (response.id! >= 10 && response.id! <= 99) {
        pokemonId2.add('0${response.id!.toString()}');
      } else {
        pokemonId2.add(response.id!.toString());
      }

      pokemonAbilities2.add(response.abilities);

      for (var i in pokemonAbilities2) {
        for (var x in i) {
          pokemonAbilitiesName2.add(x.ability.name);
        }
      }
      isLoading2.toggle();
    } catch (e) {
      isLoading2.toggle();
    }
  }
}
