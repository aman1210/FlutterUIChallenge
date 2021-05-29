import 'package:flutter/material.dart';

import '../widgets/chatMsg.dart';
import '../widgets/msgBar.dart';
import '../widgets/nameBar.dart';

class MsgScreen extends StatelessWidget {
  static const routeName = "msg-screen";
  final hand = '✌️';
  final smile = '☺️';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width =
                constraints.maxWidth > 500 ? 375 : constraints.maxWidth;
            var msgTab = Expanded(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 30),
                    height: constraints.maxHeight -
                        constraints.maxHeight * 0.16 -
                        80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffCFF1B3),
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg_msg.png'),
                        repeat: ImageRepeat.repeat,
                        fit: constraints.maxWidth < 500
                            ? BoxFit.cover
                            : BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      children: [
                        ChatMsg(
                          msg: 'Hi Anna, is the logo done?',
                          time: '22:20',
                          fromCurUser: false,
                          width: width,
                        ),
                        ChatMsg(
                          msg:
                              "Yes, I’ve sent an email with the adjustments $hand",
                          time: '22:30',
                          fromCurUser: true,
                          width: width,
                        ),
                      ],
                    ),
                  ),
                  MsgBar(smile: smile)
                ],
              ),
            );
            return Center(
              child: Container(
                width: width,
                // width: constraints.maxWidth,
                child: Column(
                  children: [
                    NameBar(
                      maxHeight: constraints.maxHeight,
                    ),
                    msgTab
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
