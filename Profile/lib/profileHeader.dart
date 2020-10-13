import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BellIcon(),
                Title(),
                ProfileDetail(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/emma-watson.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black26,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emma Watson',
                  style: TextStyle(
                      fontFamily: 'TimeBurner',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'New York',
                  style: TextStyle(
                      fontFamily: 'TimeBurner',
                      fontSize: 16,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Profile',
      style: TextStyle(
          fontFamily: "TimeBurner",
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 40,
          fontWeight: FontWeight.bold),
    );
  }
}

class BellIcon extends StatelessWidget {
  const BellIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          LineAwesomeIcons.bell,
          color: Colors.white,
          size: 30,
        ),
      ],
    );
  }
}
