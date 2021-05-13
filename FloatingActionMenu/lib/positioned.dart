import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class PositionedMenu extends StatefulWidget {
  @override
  _PositionedMenuState createState() => _PositionedMenuState();
}

class _PositionedMenuState extends State<PositionedMenu>
    with SingleTickerProviderStateMixin {
  var radius = 0.0;
  var radian = 0.0;
  List<Curve> curves = [
    Curves.bounceOut,
    Curves.easeIn,
    Curves.elasticOut,
    Curves.decelerate,
    Curves.fastOutSlowIn,
    Curves.fastLinearToSlowEaseIn
  ];
  var value = 0;

  bool isOpen = false;

  late Animation<double> animation1;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Tween<double> _rotate = Tween(begin: 0, end: math.pi);

    animation1 = _rotate.animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addListener(() {
        setState(() {
          if (controller.status == AnimationStatus.dismissed) {
            isOpen = false;
          }
        });
      });
  }

  toggleState() {
    if (isOpen) {
      controller.reverse();
    } else {
      setState(() {
        isOpen = true;
      });
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Text(
          'hello',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          BackdropFilter(
            filter: isOpen
                ? ImageFilter.blur(sigmaX: 3, sigmaY: 3)
                : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              color: !isOpen ? Colors.transparent : Colors.black54,
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 2 - 30,
            bottom: 10,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(60, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                toggleState();
              },
              child: Icon(Icons.menu),
            ),
          ),
          if (isOpen)
            Positioned(
              right: (MediaQuery.of(context).size.width / 2 - 30) +
                  (math.sin(animation1.value - math.pi / 2) *
                      ((animation1.value / math.pi) * 120)),
              bottom: 10 +
                  math.cos(animation1.value - math.pi / 2) *
                      (-(animation1.value / math.pi) * 120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60, 60),
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  print('settings');
                },
                child: Icon(Icons.sanitizer),
              ),
            ),
          if (isOpen)
            Positioned(
              right: (MediaQuery.of(context).size.width / 2 - 30) +
                  (math.sin(animation1.value - math.pi / 4) *
                      ((animation1.value / math.pi) * 120)),
              bottom: 10 +
                  math.cos(animation1.value - math.pi / 4) *
                      (-(animation1.value / math.pi) * 120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60, 60),
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  print('settings');
                },
                child: Icon(Icons.settings),
              ),
            ),
          if (isOpen)
            Positioned(
              right: (MediaQuery.of(context).size.width / 2 - 30) +
                  (math.sin(animation1.value) *
                      ((animation1.value / math.pi) * 120)),
              bottom: 10 +
                  math.cos(animation1.value) *
                      (-(animation1.value / math.pi) * 120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60, 60),
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  print('Account');
                },
                child: Icon(Icons.person),
              ),
            ),
          if (isOpen)
            Positioned(
              right: (MediaQuery.of(context).size.width / 2 - 30) +
                  (math.sin(animation1.value + math.pi / 4) *
                      ((animation1.value / math.pi) * 120)),
              bottom: 10 +
                  math.cos(animation1.value + math.pi / 4) *
                      (-(animation1.value / math.pi) * 120),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    print('Camera');
                  },
                  child: Icon(Icons.camera)),
            ),
          if (isOpen)
            Positioned(
              right: (MediaQuery.of(context).size.width / 2 - 30) +
                  (math.sin(animation1.value + math.pi / 2) *
                      ((animation1.value / math.pi) * 120)),
              bottom: 10 +
                  math.cos(animation1.value + math.pi / 2) *
                      (-(animation1.value / math.pi) * 120),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    print('Camera');
                  },
                  child: Icon(Icons.alarm)),
            ),
        ],
      ),
    );
  }
}
