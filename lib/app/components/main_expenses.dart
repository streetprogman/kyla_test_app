import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/main/controllers/main_controller.dart';
import 'expense_list_item.dart';

class MainExpenses extends GetView<MainController> {
  const MainExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
          itemCount: controller.expensesList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            var item = controller.expensesList[index];
            return ExpenseListItem(item: item,slidableController: controller.slidableControllerList[index], onOpen: () {
              controller.closeAllSlidables(except: index);
            },);
          }),
    );
  }
}
