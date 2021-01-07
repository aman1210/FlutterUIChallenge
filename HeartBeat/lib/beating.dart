import 'dart:async';

import 'package:flutter/material.dart';

class Beating extends StatefulWidget {
  final double size;
  final double opacity;
  Beating(this.size, this.opacity);
  @override
  _BeatingState createState() => _BeatingState();
}

class _BeatingState extends State<Beating> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  int count = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animation = Tween<double>(begin: widget.size, end: widget.size - 100)
        .animate(CurvedAnimation(curve: Curves.elasticIn, parent: controller))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (controller.isCompleted) {
              controller.reverse();
            } else if (controller.isDismissed) {
              count++;
              if (count % 2 == 0) {
                Timer(Duration(milliseconds: 800), () {
                  controller.forward();
                });
              } else {
                controller.forward();
              }
            }
          });
    Timer(
        Duration(
            milliseconds: widget.opacity == 0.6
                ? 400
                : widget.opacity == 0.4
                    ? 300
                    : 0), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: animation.value,
      width: animation.value,
      decoration: BoxDecoration(
          color: Colors.pink.withOpacity(widget.opacity),
          borderRadius: BorderRadius.circular(animation.value)),
    );
  }
}
