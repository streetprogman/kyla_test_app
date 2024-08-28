import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kyla_test_app3/app/components/main_expenses.dart';
import 'package:kyla_test_app3/app/components/main_header_widgets.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.indigo.shade900,
        body: const SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [MainHeader(), MainExpenses()],
            ),
          ),
        ));
  }
}
