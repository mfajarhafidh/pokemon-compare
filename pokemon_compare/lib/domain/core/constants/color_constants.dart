import 'package:flutter/material.dart';

abstract class ColorConstants {
  static const List colorBgPokemon = [
    'black',
    'blue',
    'brown',
    'gray',
    'green',
    'pink',
    'purple',
    'red',
    'white',
    'yellow'
  ];

  static void getColors() {
    colorBgPokemon[0] = Colors.black26;
    colorBgPokemon[1] = Colors.blue;
    colorBgPokemon[2] = Colors.brown;
    colorBgPokemon[3] = Colors.grey;
    colorBgPokemon[4] = Colors.teal.shade400;
    colorBgPokemon[5] = Colors.pink.shade400;
    colorBgPokemon[6] = Colors.purple.shade400;
    colorBgPokemon[7] = Colors.red.shade300;
    colorBgPokemon[8] = Colors.white10;
    colorBgPokemon[9] = Colors.yellow;
  }
}
