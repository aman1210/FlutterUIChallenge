import 'dart:math' as math;

import 'package:flutter/material.dart';

class QuickACtions extends StatelessWidget {
  final blueGradient = const LinearGradient(
    colors: const <Color>[
      const Color(0xFF0075D1),
      const Color(0xFF00A2E3),
    ],
    stops: const <double>[0.4, 0.6],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  final purpleGraient = const LinearGradient(
    colors: const <Color>[
      const Color(0xFF882DEB),
      const Color(0xFF9A4DFF),
    ],
    stops: const <double>[0.5, 0.7],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final redGradient = const LinearGradient(
    colors: const <Color>[
      const Color(0xFFBA110E),
      const Color(0xFFCF3110),
    ],
    stops: const <double>[0.6, 0.8],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 130),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 10, bottom: 20, top: 10, right: 10),
          scrollDirection: Axis.horizontal,
          children: [
            buildCard(
              name: "Live \nBroadcast",
              image: "assets/images/microphone.png",
              gradient: blueGradient,
            ),
            buildCard(
              name: "My \nWallet",
              image: "assets/images/wallet.png",
              gradient: purpleGraient,
            ),
            buildCard(
              name: "Game \nCenter",
              image: "assets/images/joystick.png",
              gradient: redGradient,
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard({LinearGradient gradient, String image, String name}) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: gradient,
          ),
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Stack(
            children: [
              Positioned(
                bottom: -10,
                right: 5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform.rotate(
                    angle: -math.pi / 5,
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'TimeBurner',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
