import 'package:flutter/material.dart';

abstract class ColorConstants {
  static Color colorByType(String type) {
    switch (type) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;

      case 'bug':
        return Colors.lightGreen;

      case 'normal':
        return Colors.grey;
      case 'poison':
        return Colors.purple;
      case 'electric':
        return Colors.yellow;
      case 'ground':
        return Colors.brown;
      case 'fairy':
        return Colors.pink;
      default:
        return Colors.white;
    }
  }

  static Color colorByStat(int stat) {
    if (stat <= 50) {
      return Colors.red;
    } else if (stat <= 100) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
