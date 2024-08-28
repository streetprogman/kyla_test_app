
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/expense.dart';
import 'animated_menu.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense item;
  final SlidableController slidableController;
  final Function() onOpen;
  const ExpenseListItem({super.key, required this.item, required this.slidableController, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: slidableController,
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          AnimatedMenu(onOpen:()=>onOpen()),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 10.0, top: 10.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(100.0))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: Colors.grey, width: 0.3)),
                  child: const Icon(
                    Icons.local_cafe_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- \$ ${item.amount}",
                      style: const TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.location_on_sharp,
                            size: 8,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          item.address,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 8.0),
                child: Text(
                  "${item.date.hour.toString().padLeft(2, "0")}:${item.date.minute.toString().padLeft(2, "0")}",
                  style: const TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
