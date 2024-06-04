import 'package:get/get.dart';
import 'package:pokemon_compare/presentation/bindings/detail_compare/detail_compare_binding.dart';
import 'package:pokemon_compare/presentation/pages/detail_compare/detail_compare_page.dart';

import '../../presentation/pages.dart';
import '../../presentation/bindings/bindings.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_COMPARE,
      page: () => const DetailComparePage(),
      binding: DetailCompareBinding(),
    ),
  ];
}
