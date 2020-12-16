import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
