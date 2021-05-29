import 'package:flutter/material.dart';

class ChatMsg extends StatelessWidget {
  const ChatMsg({
    Key? key,
    required this.msg,
    required this.time,
    required this.fromCurUser,
    required this.width,
  }) : super(key: key);

  final String msg;
  final String time;
  final bool fromCurUser;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          if (fromCurUser) Expanded(child: Container()),
          Container(
            constraints: BoxConstraints(maxWidth: width * 0.7),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: fromCurUser ? Color(0xffFFFB9D) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight:
                    !fromCurUser ? Radius.circular(20) : Radius.circular(0),
                bottomLeft:
                    fromCurUser ? Radius.circular(20) : Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  msg,
                  style: TextStyle(
                      letterSpacing: -0.2,
                      fontSize: 16,
                      color: Color(0xff364A2B),
                      height: 1.4),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff364A2B).withOpacity(0.3),
                    fontSize: 12,
                    letterSpacing: -0.2,
                    height: 1.3,
                  ),
                )
              ],
            ),
          ),
          if (!fromCurUser) Expanded(child: Container())
        ],
      ),
    );
  }
}
