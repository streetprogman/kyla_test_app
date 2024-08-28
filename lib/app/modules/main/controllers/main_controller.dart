import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:kyla_test_app3/app/models/expense.dart';

import '../../../components/animated_snackbar.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  var date = DateTime.now().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final key = GlobalKey<AnimatedSnackbarState>();
  var startHour = 6;
  var endHour = 18;
  var expensesList = List<Expense>.empty(growable: true);
  var isSnackbarOpened = false.obs;
  var slidableControllerList = List<SlidableController>.empty(growable: true);
  late AnimationController animationController;

  late Animation<double> positionAnimation;
  late Animation<double> widthAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    positionAnimation = Tween<double>(begin: 0, end: 40).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );
    widthAnimation = Tween<double>(begin: 40.0, end: 320.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1.0, curve: Curves.linear),
      ),
    );
    expensesList.addAll([
      Expense(10.95, "cafe", "Billy`s Bakery", "75 Franklin St. New York", DateTime(2024, 2, 24, 14, 42)),
      Expense(10.95, "cafe", "Billy`s Bakery", "75 Franklin St. New York", DateTime(2024, 2, 24, 14, 42)),
      Expense(122, "shop", "MoMA", "81 Spring", DateTime(2024, 2, 24, 13, 10)),
      Expense(52.39, "pets", "Candy`s", "Lafavette St", DateTime(2024, 2, 24, 14, 50)),
      Expense(10.95, "cafe", "Billy`s Bakery", "75 Franklin St. New York", DateTime(2024, 2, 24, 14, 42)),
      Expense(10.95, "cafe", "Billy`s Bakery", "75 Franklin St. New York", DateTime(2024, 2, 24, 14, 42)),
      Expense(122, "shop", "MoMA", "81 Spring", DateTime(2024, 2, 24, 13, 10)),
      Expense(52.39, "pets", "Candy`s", "Lafavette St", DateTime(2024, 2, 24, 14, 50)),
      Expense(10.95, "cafe", "Billy`s Bakery", "75 Franklin St. New York", DateTime(2024, 2, 24, 14, 42)),
      Expense(10.95, "cafe", "Billy`s Bakery", "75 Franklin St. New York", DateTime(2024, 2, 24, 14, 42)),
      Expense(122, "shop", "MoMA", "81 Spring", DateTime(2024, 2, 24, 13, 10)),
      Expense(52.39, "pets", "Candy`s", "Lafavette St", DateTime(2024, 2, 24, 14, 50)),
    ]);
    expensesList.forEach((e) {
      slidableControllerList.add(SlidableController(this));
    });
    // startSnackbar();
    super.onInit();
  }

  Future<void> removeSnackbar() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => key.currentState?.startReverse());
    isSnackbarOpened(false);
  }

  Future<void> startSnackbar() async {
    await Future.delayed(const Duration(seconds: 1)).then((value) => isSnackbarOpened(true));
    await Future.delayed(const Duration(seconds: 3)).then((value) => removeSnackbar());
  }

  void closeAllSlidables({int? except})
  {
    for(int i=0;i< slidableControllerList.length;i++)
      {
        if(except==null||i!=except)
          {
            slidableControllerList[i].close();
          }
      }
  }

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void dispose() {
    for(var item in slidableControllerList)
      {
        item.dispose();
      }
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
