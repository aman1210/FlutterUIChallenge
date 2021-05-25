import 'package:figma_challenge_4/widgets/eventTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var soicalIcons = Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                socialHandle(
                    Image.asset('assets/images/letter.png'), Color(0xffD3C7C7)),
                socialHandle(
                    Image.asset('assets/images/phone.png'), Color(0xffFCE2B6)),
                socialHandle(Image.asset('assets/images/twitter.png'),
                    Color(0xffACF8FF)),
              ],
            ),
          );
          var userName = Container(
            width: 200,
            alignment: Alignment.center,
            child: Text(
              'Laura Pergolizzi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff683B0D),
              ),
            ),
          );
          var userAbout = Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About you',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xffF89300),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Laura Pergolizzi is known professionally as LP, is an American singer and songwriter, best known for her single "Lost on You".',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(
                      0xff707070,
                    ),
                  ),
                ),
              ],
            ),
          );
          var upcomingEventTitle = Row(
            children: [
              Text(
                'Upcoming events',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xffF89300),
                ),
              ),
            ],
          );
          var userImage = Positioned(
            top: 160,
            left: (constraints.maxWidth / 2) - (117 / 2),
            child: Image.asset('assets/images/profile.png'),
          );
          var topImage = Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              'assets/images/bg.svg',
              alignment: Alignment.bottomCenter,
              height: 160,
            ),
          );
          var sky = Container(
            color: Color(0xffACF8FF),
          );
          return Stack(
            children: [
              sky,
              topImage,
              Positioned(
                bottom: 0,
                child: Container(
                  height: constraints.maxHeight - 195,
                  width: constraints.maxWidth,
                  padding: const EdgeInsets.only(top: 90, left: 28, right: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userName,
                      SizedBox(
                        height: 10,
                      ),
                      soicalIcons,
                      SizedBox(
                        height: 10,
                      ),
                      userAbout,
                      SizedBox(
                        height: 10,
                      ),
                      upcomingEventTitle,
                      SizedBox(
                        height: 8,
                      ),
                      EventTile(
                          '27', 'May', "Mom's Birthday", '9:00am - 5:00pm'),
                      EventTile('6', 'Jun', 'Concert at New York',
                          '8:00pm - 11:00pm'),
                      EventTile('30', 'Sep', 'My Birthday', 'All day'),
                    ],
                  ),
                ),
              ),
              userImage,
            ],
          );
        },
      ),
    );
  }

  Container socialHandle(Image image, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: image,
    );
  }
}
