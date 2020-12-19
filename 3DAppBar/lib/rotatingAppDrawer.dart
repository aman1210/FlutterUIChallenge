import 'dart:math';

import 'package:flutter/material.dart';

class RotatingAppDrawer extends StatefulWidget {
  @override
  _RotatingAppDrawerState createState() => _RotatingAppDrawerState();
}

class _RotatingAppDrawerState extends State<RotatingAppDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double maxDrag = 300;

  void close() => controller.reverse();

  void open() => controller.forward();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {},
        onHorizontalDragUpdate: (details) {
          setState(() {
            var delta = details.primaryDelta / maxDrag;
            controller.value += delta;
          });
        },
        onHorizontalDragEnd: (details) {
          double _kMinFlingVelocity = 365.0;

          if (controller.isDismissed || controller.isCompleted) {
            return;
          }
          if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
            double visualVelocity = details.velocity.pixelsPerSecond.dx /
                MediaQuery.of(context).size.width;

            controller.fling(velocity: visualVelocity);
          } else if (controller.value < 0.5) {
            close();
          } else {
            open();
          }
        },
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(maxDrag * (controller.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi / 2 * (1 - controller.value)),
                    alignment: Alignment.centerRight,
                    child: MyDrawer(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(maxDrag * controller.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateY(-pi * controller.value / 2.00),
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    height: 90,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    width: mediaQuery.size.width,
                    color: Theme.of(context).primaryColor,
                    alignment: Alignment.centerLeft,
                  ),
                  left: maxDrag * controller.value,
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    height: 90,
                    child: Text(
                      '3D AppDrawer',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                  ),
                  left: maxDrag * controller.value +
                      (mediaQuery.size.width / 2 - 90),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 300,
      child: Material(
        color: Colors.pink,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text('Option ${index + 1}'),
                leading: Icon(Icons.celebration),
              ),
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}
