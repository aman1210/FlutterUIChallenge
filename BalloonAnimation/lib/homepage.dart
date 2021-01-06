import 'package:BalloonAnimation/widgets.dart/balloon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/background.png',
            // color: Colors.blue,
            fit: BoxFit.fitWidth,
          ),
          color: Color(0xfff0d5b8).withOpacity(0.7),
        ),
        Balloon(1),
        Balloon(0),
        Positioned(
          bottom: 0,
          child: Container(
            height: 200,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SoulEater',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      height: 0),
                ),
                Text(
                  'Hot Air Balloon',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      height: 1.2),
                ),
                Text(
                  'Once in a lifetime adventure',
                  style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      height: 1.2),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        categoryCard('Standard', '20-24'),
                        categoryCard('Ultra Comfort', '8-16'),
                        categoryCard('Exclusive', '4'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Container categoryCard(String title, String count) {
    return Container(
      width: 200,
      // height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(blurRadius: 8, offset: Offset(4, 4), color: Colors.black26)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
          Text(
            'Flight',
            style: TextStyle(
                fontSize: 16, color: Colors.red, fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '$count people',
            style: TextStyle(
                fontSize: 14, color: Colors.black45, fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
