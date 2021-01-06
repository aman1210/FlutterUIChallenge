import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<double> slideAnimation;
  Animation<double> sizeAnimation;

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
    balloonbottomlocation = MediaQuery.of(context).size.height - 200;
    slideAnimation =
        Tween<double>(begin: balloonbottomlocation, end: 0).animate(
      controller,
    )..addListener(() {
            setState(() {});
          });
    sizeAnimation = Tween<double>(begin: 50, end: 200).animate(controller)
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
    return Scaffold(
        body: Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          top: slideAnimation.value,
          child: Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            color: Colors.blue,
          ),
        )
      ],
    ));
  }
}
