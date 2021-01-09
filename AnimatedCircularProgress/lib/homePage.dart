import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  double val = 60;
  bool pressing = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    animate();
  }

  animate() {
    controller.reset();
    animation = Tween<double>(begin: 0, end: val).animate(
        CurvedAnimation(curve: Curves.elasticInOut, parent: controller))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Circular Progress'),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter value between 0-100',
              style: TextStyle(fontSize: 24),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              width: 100,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26))),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'val',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30)),
                  onSubmitted: (value) {
                    setState(() {
                      val = double.parse(value);
                    });
                    animate();
                  },
                ),
              ),
            ),
            CustomPaint(
              foregroundPainter: CircleProgress(val: animation.value),
              child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: GestureDetector(
                    onTapDown: (details) {
                      controller.reverse();
                      setState(() {
                        pressing = true;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        pressing = false;
                      });
                      animate();
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 1,
                            color: Colors.grey[600],
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 1,
                            color: Colors.white,
                            offset: Offset(-4, -4),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: pressing
                              ? Alignment.bottomRight
                              : Alignment.topLeft,
                          end: pressing
                              ? Alignment.topLeft
                              : Alignment.bottomRight,
                          colors: [
                            Colors.grey[100],
                            Colors.grey[200],
                            Colors.grey[400],
                            Colors.grey[500],
                          ],
                          stops: [0.1, 0.3, 0.8, 0.9],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.touch_app,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleProgress extends CustomPainter {
  double val;
  CircleProgress({this.val = 50});
  @override
  void paint(Canvas canvas, Size size) {
    Paint baseColor = Paint()
      ..strokeWidth = 25
      ..color = Colors.black38
      ..style = PaintingStyle.stroke;

    Paint arc = Paint()
      ..strokeWidth = 25
      ..color = Colors.deepPurple
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 15;

    canvas.drawCircle(center, radius, baseColor);

    double angle = 2 * pi * (val / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
