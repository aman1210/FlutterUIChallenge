import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        child: Text(
          'AADIL',
          style: TextStyle(
            color: Colors.white,
            fontSize: 140,
            letterSpacing: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.9),
              Colors.transparent
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, 0.2, 0.9],
          ),
        ),
      ),
    );
  }
}
