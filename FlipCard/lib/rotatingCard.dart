import 'dart:math';

import 'package:flutter/material.dart';

class RotatingCard extends StatefulWidget {
  @override
  _RotatingCardState createState() => _RotatingCardState();
}

class _RotatingCardState extends State<RotatingCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var isFront = true;
  double horizontalDrag = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        controller.reset();
        setState(() {
          isFront = true;
          horizontalDrag = 0;
        });
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          horizontalDrag += details.delta.dy;
          horizontalDrag %= 360;
          imageSide();
        });
      },
      onVerticalDragEnd: (details) {
        final double end = 360 - horizontalDrag >= 180 ? 0 : 360;
        animation =
            Tween<double>(begin: horizontalDrag, end: end).animate(controller)
              ..addListener(() {
                setState(() {
                  horizontalDrag = animation.value;
                  imageSide();
                });
              });
        controller.forward();
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(horizontalDrag / 180 * pi),
        alignment: Alignment.center,
        child: isFront
            ? Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  child: Image.asset('assets/front.png'),
                ),
              )
            : Transform(
                transform: Matrix4.identity()..rotateY(pi),
                alignment: Alignment.center,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 20,
                  child: Container(
                    child: Image.asset('assets/back.png'),
                  ),
                ),
              ),
      ),
    );
  }

  void imageSide() {
    if (horizontalDrag <= 90 || horizontalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
