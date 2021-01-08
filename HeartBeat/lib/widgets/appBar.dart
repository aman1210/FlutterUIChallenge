import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu, size: 28, color: Colors.white),
            ),
            Expanded(
              child: Text(
                'SoulFit',
                style: TextStyle(color: Colors.white, fontSize: 36),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications, size: 28, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit,
                size: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
