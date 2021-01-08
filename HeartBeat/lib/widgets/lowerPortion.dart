import 'package:flutter/material.dart';
import 'package:heartBeat_animation/widgets/progressIndicator.dart';

class LowerPortion extends StatelessWidget {
  final Size size;
  LowerPortion(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: size.width,
      color: Colors.blue,
      child: Row(
        children: [
          indicator(
              baseColor: Colors.blue.withOpacity(0.4),
              mainColor: Colors.lightBlue[300],
              progress: 70,
              value: 0.58,
              unit: 'LTRS',
              containerColor: Colors.deepPurple[700],
              iconData: Icons.local_drink_rounded,
              category: 'DRINK'),
          indicator(
              baseColor: Colors.green.withOpacity(0.4),
              mainColor: Colors.lightGreen[300],
              progress: 50,
              value: 458,
              unit: 'GRMS.',
              containerColor: Colors.deepPurple,
              iconData: Icons.fastfood_rounded,
              category: 'FOOD'),
          indicator(
              baseColor: Colors.red.withOpacity(0.4),
              mainColor: Colors.orange[800],
              progress: 30,
              value: 7.30,
              unit: 'HRS',
              containerColor: Colors.deepPurple[700],
              iconData: Icons.bedtime,
              category: 'SLEEP'),
        ],
      ),
    );
  }

  Expanded indicator({
    Color baseColor,
    Color mainColor,
    double progress,
    double value,
    String unit,
    Color containerColor,
    IconData iconData,
    String category,
  }) {
    return Expanded(
      child: Container(
        color: containerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProgresIndicator(baseColor, mainColor, progress, value, unit),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  iconData,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  category,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
