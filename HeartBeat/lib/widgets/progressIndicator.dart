import 'dart:math';

import 'package:flutter/material.dart';

class CustomProgresIndicator extends StatelessWidget {
  CustomProgresIndicator(
      this.baseColor, this.main, this.progress, this.value, this.unit);
  final Color baseColor;
  final Color main;
  final double progress;
  final double value;
  final String unit;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircleProgress(baseColor, main, progress),
      child: Container(
        height: 120,
        width: 120,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$value',
                style: TextStyle(color: main, fontSize: 22),
              ),
              Text(
                '$unit',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleProgress extends CustomPainter {
  CircleProgress(this.baseColor, this.main, this.progress);
  Color baseColor;
  Color main;
  double progress;
  @override
  void paint(Canvas canvas, Size size) {
    //base circle
    Paint outsideCircle = Paint()
      ..strokeWidth = 10
      ..color = baseColor
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 10
      ..color = main
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(center, radius, outsideCircle); // draws base circle

    double angle = 2 * pi * (progress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
