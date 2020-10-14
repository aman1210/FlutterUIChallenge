import 'package:flutter/material.dart';

class QuickACtions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(left: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
            child: Container(
              // margin: const EdgeInsets.all(10),
              height: 120,
              width: 150,
              color: Colors.amber,
              child: Text("Hello"),
            ),
          ),
          Card(
            child: Container(
              // margin: const EdgeInsets.all(10),
              height: 120,
              width: 150,
              color: Colors.amber,
              child: Text("Hello"),
            ),
          ),
          Card(
            child: Container(
              // margin: const EdgeInsets.all(10),
              height: 120,
              width: 150,
              color: Colors.amber,
              child: Text("Hello"),
            ),
          ),
        ],
      ),
    );
  }
}
