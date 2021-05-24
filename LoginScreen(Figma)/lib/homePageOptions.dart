import 'package:flutter/material.dart';

class HomePageOptions extends StatelessWidget {
  final bool isOpen;
  final Size size;
  final Function changeState;
  HomePageOptions(
      {required this.isOpen, required this.size, required this.changeState});
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: isOpen ? 0 : 1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 40),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset('assets/images/Group.png'),
                ),
                Text(
                  'Sour',
                  style: TextStyle(
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Best drink \nreceipes',
                  style: TextStyle(
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 3.5,
          ),
          Container(
            width: size.width * 0.5,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  Color(0xffFAAF6B),
                  Color(0xffF89500),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.8],
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 20,
                  color: Color(0xffD83131).withOpacity(0.2),
                )
              ],
            ),
            child: Text(
              'Sign up',
              style: TextStyle(
                fontFamily: 'SFCompact',
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height / 52,
          ),
          InkWell(
            onTap: () {
              changeState(true);
            },
            child: Container(
              width: size.width * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 20,
                    color: Color(0xffD83131).withOpacity(0.2),
                  )
                ],
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'SFCompact',
                  fontSize: 18,
                  color: Color(0xffFA6B74),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 52,
          ),
          Text(
            'Forgot Password?',
            style: TextStyle(
                fontFamily: 'SFCompact',
                fontSize: 18,
                color: Color(0xff3D0007)),
          ),
          SizedBox(
            height: size.height / 16,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xff3F0108),
                ),
              ),
              Expanded(
                child: Container(
                  // height: 1,
                  width: double.infinity,
                  // color: Color(0xff3F0108),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/logo-instagram 1.png'),
                      Image.asset('assets/images/logo-fb-simple 1.png'),
                      Image.asset('assets/images/logo-twitter 1.png'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xff3F0108),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 24,
          )
        ],
      ),
    );
  }
}
