import 'package:flutter/material.dart';

import 'package:heartBeat_animation/widgets/upperPortion.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          UpperPortion(size: size),
          Container(
            height: 250,
            width: size.width,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
