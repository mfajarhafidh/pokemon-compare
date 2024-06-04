import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_compare/presentation/controllers/detail_compare/detail_compare_controller.dart';

class TabBaseStats extends GetView<DetailCompareController> {
  const TabBaseStats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.pokemonStats.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                20.verticalSpace,
                _rowTextGraph(
                    title: controller.pokemonStats[index],
                    fillText: controller.pokemonBaseStats[index].toDouble(),
                    progress:
                        (controller.pokemonBaseStats[index].toDouble()) / 100),
              ],
            ),
          );
        });
  }

  Widget _rowTextGraph(
      {required String title,
      required double fillText,
      required double progress}) {
    return Row(
      children: [
        SizedBox(
          width: 45.w,
          child: Text(
            title.capitalizeFirst!,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
          ),
        ),
        20.horizontalSpace,
        SizedBox(
          width: 15.w,
          child: Text(
            fillText.toString().replaceAll('.0', ''),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
          ),
        ),
        LinearPercentIndicator(
          width: 120.w,
          lineHeight: 3.h,
          percent: progress,
          progressColor: controller.colorProgress(progress: progress),
        ),
      ],
    );
  }
}
