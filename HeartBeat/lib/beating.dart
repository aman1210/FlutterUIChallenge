import 'package:flutter/material.dart';

class Beating extends StatefulWidget {
  @override
  _BeatingState createState() => _BeatingState();
}

class _BeatingState extends State<Beating> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animation = Tween<double>(begin: 100, end: 50)
        .animate(CurvedAnimation(curve: Curves.elasticIn, parent: controller))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((stauts) {
            if (controller.isCompleted) {
              controller.reverse();
            } else if (controller.isDismissed) {
              controller.forward();
            }
          });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: animation.value,
      width: animation.value,
      color: Colors.red,
    );
  }
}
