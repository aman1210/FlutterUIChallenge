import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> slideAnimation;
  Animation<double> hoverAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    slideAnimation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(controller.value);
    return Scaffold(
      body: Stack(children: [
        Positioned(
          bottom: slideAnimation.status == AnimationStatus.completed
              ? hoverAnimation.value
              : slideAnimation.value,
          child: Container(
            height: slideAnimation.value,
            width: slideAnimation.value,
            color: Colors.blue,
          ),
        ),
      ]),
    );
  }
}
