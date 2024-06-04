import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokemon_compare/domain/core/constants/assets_constants.dart';
import 'package:pokemon_compare/domain/core/constants/color_constants.dart';
import 'package:pokemon_compare/domain/core/utils/style_utils.dart';
import 'package:pokemon_compare/domain/core/utils/tab_utils.dart';
import 'package:pokemon_compare/presentation/controllers/detail_compare/detail_compare_controller.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_about.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_base_stats.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_evolution.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_moves.dart';

class DetailComparePage extends GetView<DetailCompareController> {
  const DetailComparePage({super.key});

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
                : Obx(
                    () => controller.namePokemonChosen.toString().isNotEmpty
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: _sideDrawer())
                        : const SizedBox(),
                  ),
          ),
          Positioned(
            top: 100.h,
            left: 40.w,
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Text(
                'Pokedex',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          15.verticalSpace,
          Positioned(
            top: 50.h,
            left: 20.w,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }

  Widget _sideDrawer() {
    return Container(
      height: 500.h,
      decoration: BoxDecoration(
          color: ColorConstants.colorByType(
            controller.pokemonType.first,
          ),
          borderRadius: BorderRadius.circular(20.r)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.pokemonName.first.capitalizeFirst!,
                        style: StyleUtils.titleDetailText,
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30.r)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              controller.pokemonType.first.capitalizeFirst!,
                              style: StyleUtils.normalText,
                            ),
                          ),
                          10.horizontalSpace,
                          controller.pokemonType2.first == '' ||
                                  controller.pokemonType2.first.isEmpty ||
                                  controller.pokemonType2.first.isBlank!
                              ? const SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  child: Text(
                                    controller
                                        .pokemonType2.first.capitalizeFirst!,
                                    style: StyleUtils.normalText,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 30.w, top: 20.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '#${controller.pokemonId.first}',
                      style: StyleUtils.titleText.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 20.h,
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                AssetsConstants.backgroundPokeball,
                height: 300.h,
              ),
            ),
          ),
          Obx(
            () => Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 280.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r))),
                child: Column(
                  children: [
                    TabUtils(
                      selectedIndex: controller.selectedPage.value,
                      onTap: (pageIndex) {
                        controller.selectedPage(pageIndex);
                        controller.pageController.jumpToPage(pageIndex);
                      },
                    ),
                    SizedBox(
                      height: 220.h,
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (pageIndex) {
                          controller.selectedPage(pageIndex);
                        },
                        children: const [
                          TabAbout(),
                          TabBaseStats(),
                          TabEvolution(),
                          TabMoves(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 70.w,
              top: 50.h,
              child: CachedNetworkImage(
                height: 200.h,
                imageUrl: controller.pokemonImage.first.frontDefault.toString(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.transparent,
                ),
                placeholder: (context, url) => Container(
                  color: Colors.transparent,
                ),
              )),
        ],
      ),
    );
  }
}
