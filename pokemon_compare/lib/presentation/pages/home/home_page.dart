import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokemon_compare/domain/core/constants/assets_constants.dart';
import 'package:pokemon_compare/domain/core/constants/color_constants.dart';
import 'package:pokemon_compare/domain/core/utils/style_utils.dart';
import 'package:pokemon_compare/infrastructure/navigation/routes.dart';

import '../../controllers/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = Get.mediaQuery.padding.top;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: statusBarHeight - 240 / 2.9,
              left: Get.width - (240 / 1.6),
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  AssetsConstants.backgroundPokeball,
                  height: 240.h,
                  width: 240.w,
                ),
              ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: Colors.black,
                        rightDotColor: Colors.red,
                        size: 200,
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Text(
                            'Pokedex',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        15.verticalSpace,
                        Obx(
                          () => _gridItem(),
                        ),
                      ],
                    ),
            ),
          ],
        ));
  }

  Widget _gridItem() {
    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: controller.namePokemonChosen.value != '' ? 1 : 2,
        ),
        itemCount: controller.pokemonNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.DETAIL_COMPARE,
                  arguments: [int.parse(controller.pokemonIdList[index])]);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorConstants.colorByType(
                        controller.pokemonTypeList[index])),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '#${controller.pokemonIdList[index].toString()}',
                                style: StyleUtils.titleText
                                    .copyWith(color: Colors.black12),
                              )),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller
                                  .pokemonNameList[index].capitalizeFirst!,
                              style: StyleUtils.titleText,
                            )),
                        10.verticalSpace,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: controller.pokemonTypeList[index] == '' ||
                                    controller.pokemonTypeList[index].isEmpty
                                ? const SizedBox()
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Text(
                                      controller.pokemonTypeList[index]
                                          .capitalizeFirst!,
                                      style: StyleUtils.normalText,
                                    ))),
                        10.verticalSpace,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: controller.pokemonTypeList2[index] == '' ||
                                    controller
                                        .pokemonTypeList2[index].isEmpty ||
                                    controller.pokemonTypeList2[index].isBlank!
                                ? const SizedBox()
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Text(
                                        controller.pokemonTypeList2[index]
                                            .capitalizeFirst!,
                                        style: StyleUtils.normalText))),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        AssetsConstants.backgroundPokeball,
                        height: 65.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: CachedNetworkImage(
                            height: 100,
                            imageUrl: controller
                                .pokemonImageList[index].frontDefault
                                .toString(),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.transparent,
                            ),
                            placeholder: (context, url) => Container(
                              color: Colors.transparent,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
