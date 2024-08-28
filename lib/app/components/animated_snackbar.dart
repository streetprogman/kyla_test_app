import 'package:easy_animate/animation/pulse_animation.dart';
import 'package:easy_animate/enum/animate_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedSnackbar extends StatefulWidget {
  final Function()? onDismiss;
  const AnimatedSnackbar({super.key, this.onDismiss});

  @override
  State<AnimatedSnackbar> createState() => AnimatedSnackbarState();
}

class AnimatedSnackbarState extends State<AnimatedSnackbar> with TickerProviderStateMixin{
  late AnimationController animationController;
  late AnimationController waveController;
  late Animation<double> positionAnimation;
  late Animation<double> widthAnimation;
  late Animation<double> opacityAnimation;

  Future<void> startReverse() async
  {
    await animationController.reverse();
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    // Контроллер анимации для волны
    waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:2000),
    );
    positionAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.bounceOut),
      ),
    );
    widthAnimation = Tween<double>(begin: 50.0, end: 300.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.linear),
      ),
    );
        animationController.forward();
        animationController.addStatusListener((status) {
          if(status == AnimationStatus.completed)
            {
              waveController.repeat();
            }
        });
          // animationController.reverse();
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    waveController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction){
        if(widget.onDismiss!=null) {
          widget.onDismiss!();
        }
      },
      key: Key("snack"),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Внешняя волна
           AnimatedBuilder(
              animation: waveController,
              builder: (context, child) {
                return Padding(
                    padding: EdgeInsets.only(top:positionAnimation.value),
                child:CustomPaint(
                  painter: RectangularWavePainter(waveController.value),
                  size: Size(280, 50),
                ));
              },
          ),
          AnimatedBuilder(
            builder: (context,child) {
              return  PulseAnimation(
                delay: const Duration(seconds: 1),
                durationMilliseconds: 2000,
                animateType: AnimateType.loop,
                child: Padding(
                    padding: EdgeInsets.only(top:positionAnimation.value),
                    child: Center(
                      child: Container(height: 50,width: widthAnimation.value,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100.0),

                      ),
                      child: Opacity(
                        opacity: opacityAnimation.value,
                        child:const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.local_fire_department_outlined,size: 25,color: Colors.white),
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 6),
                            child: Text("You are too close to the day limit!! Only 10 dollars left ",style: TextStyle(color: Colors.white,),),
                          ))

                        ],
                      ),
                      ),
                    ),
                  ),
                ),
              );
            }, animation: animationController,
          ),
        ],
      ),
    );
  }
}

class RectangularWavePainter extends CustomPainter {
  final double animationValue;
  final double borderRadius = 10.0; // Радиус скругления углов

  RectangularWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final double maxWidth = size.width; // Максимальная ширина волны
    final double maxHeight = size.height; // Максимальная высота волны
    final double currentWidth = maxWidth * (1 + animationValue * 0.5); // Текущая ширина волны
    final double currentHeight = maxHeight * (1 + animationValue * 0.5); // Текущая высота волны

    final paint = Paint()
      ..color = Colors.red.withOpacity(0.5 - animationValue*0.5) // Прозрачность волны
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    // Рисуем прямоугольную волну с закругленными углами
    if(animationValue!=0) {
      canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 1.95), // Центр прямоугольника
          width: currentWidth, // Ширина прямоугольника
          height: currentHeight, // Высота прямоугольника
        ),
        Radius.circular(200.0), // Радиус скругления углов
      ),
      paint,
    );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}