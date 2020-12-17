import 'package:flutter/material.dart';

class TabBarOption extends StatelessWidget {
  const TabBarOption({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'All',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                'Sneakers',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                'Football',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                'Soccer',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
