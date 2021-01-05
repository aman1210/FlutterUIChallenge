import 'dart:math';

import 'package:flutter/material.dart';

class PlaceCounter extends StatelessWidget {
  const PlaceCounter({
    Key key,
    @required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                '0${currentIndex + 1}',
                style: TextStyle(
                    fontSize: 28, color: Colors.white, fontFamily: 'Poppins'),
              ),
              Text(
                '/10',
                style: TextStyle(
                    fontSize: 12, color: Colors.white60, fontFamily: 'Poppins'),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.rotate(
                angle: pi,
                child: Image.asset(
                  'assets/images/arrow.png',
                  width: 50,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/arrow.png',
                width: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
