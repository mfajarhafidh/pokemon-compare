import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_compare/presentation/controllers/home/home_controller.dart';

class TabBaseStats extends GetView<HomeController> {
  final bool second;
  const TabBaseStats({super.key, required this.second});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        _rowTextGraph(title: 'HP', fillText: 45, progress: 0.45),
        10.verticalSpace,
        _rowTextGraph(title: 'Attack', fillText: 60, progress: 0.45),
        10.verticalSpace,
        _rowTextGraph(title: 'Defense', fillText: 48, progress: 0.45),
        10.verticalSpace,
        _rowTextGraph(title: 'Sp. Atk', fillText: 65, progress: 0.45),
        10.verticalSpace,
        _rowTextGraph(title: 'Sp. Def', fillText: 65, progress: 0.45),
      ],
    );
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
            title,
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
          progressColor: Colors.green,
        ),
      ],
    );
  }
}
