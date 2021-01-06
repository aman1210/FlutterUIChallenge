import 'package:flutter/material.dart';

class Balloon extends StatefulWidget {
  final int index;
  Balloon(this.index);
  @override
  _BalloonState createState() => _BalloonState();
}

class _BalloonState extends State<Balloon> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<double> slideAnimation;
  Animation<double> sizeAnimation;
  Animation<double> opacityAnimation;

  double balloonbottomlocation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    balloonbottomlocation = widget.index == 0
        ? MediaQuery.of(context).size.height / 3
        : MediaQuery.of(context).size.height / 3 - 30;
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0, 0.5, curve: Curves.easeIn)));
    sizeAnimation = Tween<double>(begin: 50, end: 400).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (controller.status == AnimationStatus.completed) {
          print('hello');
          slideAnimation = Tween<double>(begin: 0, end: 50).animate(controller2)
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                controller2.reverse();
              } else if (status == AnimationStatus.dismissed) {
                controller2.forward();
              }
            });
          controller2.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: controller.status == AnimationStatus.completed
          ? balloonbottomlocation - slideAnimation.value
          : balloonbottomlocation,
      // left: 100,
      right: widget.index == 0 ? null : -260,
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Container(
          height: 800,
          width: 600,
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/hot_air_balloon.png',
            color: widget.index == 0 ? null : Colors.black.withOpacity(0.2),
            height: widget.index == 0
                ? sizeAnimation.value * 1.75
                : sizeAnimation.value * 1.25,
          ),
        ),
      ),
    );
  }
}
