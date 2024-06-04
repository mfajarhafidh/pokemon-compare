import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokemon_compare/presentation/controllers/detail_compare/detail_compare_controller.dart';

class TabAbout extends GetView<DetailCompareController> {
  const TabAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          20.verticalSpace,
          _rowText(
              title: 'Species',
              fillText: controller.pokemonSpecies.value.capitalizeFirst!),
          10.verticalSpace,
          _rowText(title: 'Height', fillText: controller.pokemonHeight.first),
          10.verticalSpace,
          _rowText(title: 'Weight', fillText: controller.pokemonWeight.first),
          10.verticalSpace,
          _rowText(
              title: 'Abilities',
              fillText:
                  controller.pokemonAbilitiesName.join(', ').capitalizeFirst!),
        ],
      ),
    );
  }

  Widget _rowText({required String title, required String fillText}) {
    return Row(
      children: [
        SizedBox(
          width: 45.w,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
          ),
        ),
        20.horizontalSpace,
        Text(
          fillText,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
        ),
      ],
    );
  }
}
