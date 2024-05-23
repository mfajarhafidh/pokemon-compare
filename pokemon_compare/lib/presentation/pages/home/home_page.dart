import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pokemon_compare/domain/core/constants/assets_constants.dart';
import 'package:pokemon_compare/domain/core/utils/style_utils.dart';
import 'package:pokemon_compare/domain/core/utils/tab_utils.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_about.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_base_stats.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_evolution.dart';
import 'package:pokemon_compare/presentation/pages/home/tabs/tab_moves.dart';

import '../../controllers/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
              child: ListView(
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
            Obx(
              () => controller.namePokemonChosen.toString().isNotEmpty
                  ? controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: Row(
                            children: [
                              _sideDrawer(secondDrawer: false),
                              // controller.isLoading2.value
                              //     ? CircularProgressIndicator()
                              //     : Expanded(
                              //         child: _sideDrawer(secondDrawer: true)),
                            ],
                          ),
                        )
                  : const SizedBox(),
            ),
            Obx(
              () => controller.namePokemonChosen2.toString().isNotEmpty
                  ? controller.isLoading2.value
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: Row(
                            children: [
                              controller.isLoading2.value
                                  ? const CircularProgressIndicator()
                                  : Expanded(
                                      child: _sideDrawer(secondDrawer: true)),
                            ],
                          ),
                        )
                  : const SizedBox(),
            ),
          ],
        ));
  }

  Widget _gridItem() {
    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: controller.pokemonNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return controller.isLoading.value
              ? const CircularProgressIndicator()
              : InkWell(
                  onTap: () {
                    if (controller.namePokemonChosen.value.isEmpty ||
                        controller.namePokemonChosen.value == '') {
                      controller.selectedPokemon(
                          int.parse(controller.pokemonIdList[index]));
                    } else {
                      controller.selectedPokemon2(
                          int.parse(controller.pokemonIdList[index]));
                      controller.namePokemonChosen.value = '';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.w, top: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.green),
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
                                    controller.pokemonNameList[index]
                                        .capitalizeFirst!,
                                    style: StyleUtils.titleText,
                                  )),
                              10.verticalSpace,
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: controller.pokemonTypeList[index] ==
                                              '' ||
                                          controller
                                              .pokemonTypeList[index].isEmpty
                                      ? const SizedBox()
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
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
                                  child: controller.pokemonTypeList2[index] ==
                                              '' ||
                                          controller.pokemonTypeList2[index]
                                              .isEmpty ||
                                          controller
                                              .pokemonTypeList2[index].isBlank!
                                      ? const SizedBox()
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
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
                              child: Image.network(
                                controller.pokemonImageList[index].frontDefault
                                    .toString(),
                                height: 70.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }

  Widget _sideDrawer({required bool secondDrawer}) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(20.r)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        secondDrawer == true
                            ? controller.pokemonName2.first.capitalizeFirst!
                            : controller.pokemonName.first.capitalizeFirst!,
                        style: StyleUtils.titleText,
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(30.r)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              secondDrawer == true
                                  ? controller.pokemonType22.first
                                  : controller.pokemonType.first,
                              style: StyleUtils.normalText,
                            ),
                          ),
                          10.horizontalSpace,
                          secondDrawer == true
                              ? controller.pokemonType4.first == '' ||
                                      controller.pokemonType4.first.isEmpty ||
                                      controller.pokemonType4.first.isBlank!
                                  ? const SizedBox()
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(30.r)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Text(
                                        controller.pokemonType4.first,
                                        style: StyleUtils.normalText,
                                      ),
                                    )
                              : controller.pokemonType2.first == '' ||
                                      controller.pokemonType2.first.isEmpty ||
                                      controller.pokemonType2.first.isBlank!
                                  ? const SizedBox()
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(30.r)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Text(
                                        controller.pokemonType2.first,
                                        style: StyleUtils.normalText,
                                      ),
                                    ),
                        ],
                      ),
                    ],
                  ),
                ),
                60.horizontalSpace,
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    secondDrawer == true
                        ? '#${controller.pokemonId2.first}'
                        : '#${controller.pokemonId.first}',
                    style: StyleUtils.titleText.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 150.h,
            child: Image.asset(
              AssetsConstants.backgroundPokeball,
              height: 65.h,
            ),
          ),
          Obx(
            () => Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 200.h,
                width: 200.w,
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
                      height: 150.h,
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (pageIndex) {
                          controller.selectedPage(pageIndex);
                        },
                        children: [
                          TabAbout(
                            second: secondDrawer == true ? true : false,
                          ),
                          TabBaseStats(
                            second: secondDrawer == true ? true : false,
                          ),
                          const TabEvolution(),
                          const TabMoves(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20.w,
            top: 90.h,
            child: Image.network(
              secondDrawer == true
                  ? controller.pokemonImage2.first.frontDefault.toString()
                  : controller.pokemonImage.first.frontDefault.toString(),
              height: 120.h,
            ),
          ),
        ],
      ),
    );
  }
}
