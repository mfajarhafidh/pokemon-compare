import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pokemon_compare/presentation/controllers/home/home_controller.dart';

class TabAbout extends GetView<HomeController> {
  final bool second;
  const TabAbout({super.key, required this.second});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        _rowText(
            title: 'Height',
            fillText: second == true
                ? '${controller.pokemonHeight2.first} dm'
                : '${controller.pokemonHeight.first} dm'),
        10.verticalSpace,
        _rowText(
            title: 'Weight',
            fillText: second == true
                ? '${controller.pokemonWeight2.first} hg'
                : '${controller.pokemonWeight.first} hg'),
        10.verticalSpace,
        _rowText(
            title: 'Abilities',
            fillText: second == true
                ? controller.pokemonAbilitiesName2.join(', ').capitalizeFirst!
                : controller.pokemonAbilitiesName.join(', ').capitalizeFirst!),
      ],
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
