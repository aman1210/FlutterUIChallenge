import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
