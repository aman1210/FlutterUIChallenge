import 'package:flutter/material.dart';
import 'package:heartBeat_animation/beating.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center(
          //   child: Container(
          //     height: 80,
          //     width: 80,
          //     color: Colors.red,
          //   ),
          // ),
          Center(
            // child: Container(
            //   height: 60,
            //   width: 60,
            //   color: Colors.red.shade200,
            // ),
            child: Beating(),
          ),
          // Text('hello world 2'),
        ],
      ),
    );
  }
}
