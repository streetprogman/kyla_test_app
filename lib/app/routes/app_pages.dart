import 'package:get/get.dart';
import 'package:kyla_test_app3/app/modules/main/bindings/main_binding.dart';
import 'package:kyla_test_app3/app/modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
        name: _Paths.MAIN,
        page: () => const MainView(),
        bindings: [MainBinding()]),
  ];
}
