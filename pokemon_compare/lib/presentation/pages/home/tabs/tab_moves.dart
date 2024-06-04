import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokemon_compare/domain/core/utils/style_utils.dart';
import 'package:pokemon_compare/presentation/controllers/detail_compare/detail_compare_controller.dart';

class TabMoves extends GetView<DetailCompareController> {
  const TabMoves({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Text(
          controller.pokemonMove.value,
          style: StyleUtils.normalText.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
