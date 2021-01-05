import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.png',
                height: 30,
              ),
              Text(
                'travello',
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Poppins'),
              )
            ],
          ),
          Icon(
            CupertinoIcons.search,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
