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
                      child: SafeArea(child: MyDrawer())),
                ),
                Transform.translate(
                  offset: Offset(maxDrag * controller.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateY(-pi * controller.value / 2),
                    child: MyHomePage(),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 60,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    width: mediaQuery.size.width,
                    color: Theme.of(context).primaryColor,
                    alignment: Alignment.centerLeft,
                  ),
                  top: mediaQuery.padding.top,
                  // width:mediaQuery.size.width ,
                  left: maxDrag * controller.value,
                ),
                Positioned(
                  child: Text("Hello World!"),
                  top: mediaQuery.size.height / 2,
                  left: (maxDrag * controller.value) +
                      (mediaQuery.size.width / 2 - 40),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ListTile(
                  leading: Icon(Icons.new_releases),
                  title: Text('News'),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Favourites'),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Change AppBar Animation'),
          ],
        ),
      ),
    );
  }
}
