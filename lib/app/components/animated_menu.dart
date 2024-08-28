import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedMenu extends StatefulWidget {
  final Function() onOpen;

  const AnimatedMenu({super.key, required this.onOpen});

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu> with TickerProviderStateMixin {
  late Animation<double> heightAnimation;
  late AnimationController animationController;
  late Animation<double> widthAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    widget.onOpen();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    heightAnimation = Tween<double>(begin: 0, end: 80).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );
    widthAnimation = Tween<double>(begin: 0.0, end: 160.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1.0, curve: Curves.linear),
      ),
    );
    super.initState();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 180 - widthAnimation.value, vertical: 100 - heightAnimation.value),
            child: Container(
              decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(100.0)),
              child: Opacity(
                opacity: opacityAnimation.value,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.grey))),
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.grey))),
                            height: double.infinity,
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            height: double.infinity,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
