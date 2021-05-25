import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String date;
  final String month;
  final String name;
  final String time;
  EventTile(this.date, this.month, this.name, this.time);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minHeight: 64, minWidth: 64),
            decoration: BoxDecoration(
              color: Color(0xffFCE2B6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color(0xffF89300),
                  ),
                ),
                Text(
                  month,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xffF89300),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff707070),
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xff707070),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
