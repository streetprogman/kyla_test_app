
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../modules/main/controllers/main_controller.dart';

class HeaderWidget extends GetView<MainController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: 80,
          width: 60,
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: "${controller.date.value.day}\n",
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: DateFormat('MMM').format(DateTime(0, controller.date.value.month)),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.white),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0), child: Image.asset("lib/assets/avatar.png")),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Isaac Norman".toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "1234 **** **** 5678",
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      "lib/assets/mastercard.png",
                                      width: 12,
                                      height: 12,
                                    ),
                                  ))
                            ]),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: MaterialStateProperty.all(const CircleBorder())),
                  onPressed: () {},
                  child: const Icon(Icons.arrow_drop_down_outlined),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 80,
          width: 60,
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                //Manual call snackbar for the demonstration
                controller.startSnackbar();
              },
            ),
          ),
        )
      ],
    );
  }
}

