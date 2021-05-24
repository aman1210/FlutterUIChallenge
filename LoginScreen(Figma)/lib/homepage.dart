import 'package:figma_challenge_day_2/homePageOptions.dart';
import 'package:figma_challenge_day_2/loginform.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOpen = false;

  changeState(bool newState) {
    setState(() {
      isOpen = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var animatedBg = AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: isOpen ? -size.height / 2.3 : -size.height / 48,
      left: isOpen ? -size.width / 1.2 : -size.width / 2.4,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: isOpen ? size.width * 2.2 : size.width * 1.56,
        child: Image.asset(
          'assets/images/bg.png',
          fit: BoxFit.cover,
          // width: size.width,
        ),
      ),
    );
    var backArrow = Positioned(
      top: 40,
      left: 20,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isOpen ? 1 : 0,
        child: InkWell(
          onTap: () {
            setState(() {
              isOpen = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            height: 56,
            width: 56,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffFA6B74),
              size: 24,
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Color(0xffffdce0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            animatedBg,
            HomePageOptions(
              isOpen: isOpen,
              size: size,
              changeState: changeState,
            ),
            backArrow,
            LoginForm(isOpen: isOpen, size: size),
          ],
        ),
      ),
    );
  }
}
