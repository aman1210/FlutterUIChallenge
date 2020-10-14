import 'package:flutter/material.dart';

import 'package:uiChallengeProfile/header/bellIcon.dart';
import 'package:uiChallengeProfile/header/profileDetail.dart';
import 'package:uiChallengeProfile/header/profileTitle.dart';

class ProfileHeader extends StatelessWidget {
  final headerHeight = 310.0;
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    var headerGraident = Container(
      height: headerHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [const Color(0xFF7928D1), const Color(0xFF9A4DFF)],
          stops: [0.3, 0.5],
        ),
      ),
    );

    var statsDivier = Container(
      height: 30,
      width: 1,
      decoration: BoxDecoration(color: Colors.white70),
    );
    return Container(
      height: headerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF9A10FF),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 2,
            color: Colors.black38,
          )
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          headerGraident,
          Padding(
            padding: EdgeInsets.only(
              top: topPadding,
              left: 25,
              right: 15,
              bottom: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BellIcon(),
                ProfileTitle(),
                ProfileDetail(),
                Row(
                  children: [
                    buildStats("Followers", "5.7M"),
                    statsDivier,
                    buildStats("Following", "924"),
                    statsDivier,
                    buildStats("Total Likes", "1.7K")
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildStats(String name, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            '$name',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'TimeBurner',
                fontWeight: FontWeight.bold,
                color: Colors.white60),
          ),
          Text(
            "$value",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'TimeBurner',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
