import 'package:flutter/material.dart';

import 'package:heartBeat_animation/widgets/appBar.dart';
import 'package:heartBeat_animation/widgets/beating.dart';

class UpperPortion extends StatelessWidget {
  const UpperPortion({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height - 220,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.purple,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.deepPurple, BlendMode.hardLight),
          image: AssetImage('assets/meditation.jpg'),
        ),
      ),
      child: Stack(
        children: [
          CustomAppBar(size: size),
          beatingContainer(350, 0.2),
          beatingContainer(250, 0.4),
          beatingContainer(150, 0.6),
          Center(
            child: Icon(
              Icons.favorite,
              size: 80,
              color: Colors.white,
            ),
          ),
          HeartRate(size: size)
        ],
      ),
    );
  }

  Center beatingContainer(double size, double opacity) {
    return Center(
      child: Beating(size, opacity),
    );
  }
}

class HeartRate extends StatelessWidget {
  const HeartRate({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Container(
        width: size.width,
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'HEART RATE',
                    style:
                        TextStyle(fontSize: 22, color: Colors.white, height: 3),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '84',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w300,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BPM',
                      style: TextStyle(
                        color: Colors.white,
                        height: 2.7,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
