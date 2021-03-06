import 'package:flutter/material.dart';
import 'package:heartBeat_animation/widgets/lowerPortion.dart';

import 'package:heartBeat_animation/widgets/upperPortion.dart';
import 'package:heartBeat_animation/widgets/progressIndicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          UpperPortion(size: size),
          LowerPortion(size),
        ],
      ),
    );
  }
}
