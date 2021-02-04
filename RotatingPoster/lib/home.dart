import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:rotatingPoster/text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;

  bool isOnRight(double rotation) {
    return math.cos(rotation) < 0;
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final numberOfText = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(
            numberOfText,
            (index) {
              return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final animationRotationValue =
                        controller.value * 2 * math.pi / numberOfText;
                    double rotation = 2 * math.pi * index / numberOfText +
                        math.pi / 2 +
                        animationRotationValue;
                    if (!isOnRight(rotation)) {
                      rotation = -rotation +
                          2 * animationRotationValue -
                          math.pi * 2 / numberOfText;
                    }
                    return Transform(
                      alignment: Alignment.center,
                      child: child,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(rotation)
                        ..translate(-120.0),
                    );
                  },
                  child: MainText());
            },
          ),
        ),
      ),
    );
  }
}
