import 'package:flutter/material.dart';

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
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
