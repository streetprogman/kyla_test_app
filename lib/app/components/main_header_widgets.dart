import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/main/controllers/main_controller.dart';
import 'animated_snackbar.dart';
import 'bar_chart_widget.dart';
import 'header_widget.dart';

class MainHeader extends GetView<MainController> {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Stack(clipBehavior: Clip.none, children: [
        const BarChartWidget(),
        Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Obx(() => controller.isSnackbarOpened.value
                ? AnimatedSnackbar(
                    key: controller.key,
                    onDismiss: controller.closeAllSlidables,
                  )
                : Container())),
        const HeaderWidget()
      ]),
    );
  }
}
