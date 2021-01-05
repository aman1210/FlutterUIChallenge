import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/fadeAndSlideAnimation.dart';
import 'package:travel_app/widgets/placedetailscreen/appBar.dart';

import '../data.dart';

class PlaceDetailScreen extends StatefulWidget {
  PlaceDetailScreen(this.placeDetail, this.size);
  final PlaceDetail placeDetail;
  final Size size;

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  bool isReadingInDetail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.placeDetail.img,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.placeDetail.img),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Text(
                        widget.placeDetail.placeName,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            letterSpacing: -2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          PlaceScreenAppBar(size: widget.size),
          FadeAnimation(
            00.6,
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                alignment: Alignment.bottomCenter,
                height: !isReadingInDetail
                    ? widget.size.height - 360
                    : widget.size.height - 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: FadeAnimation(
                  1.3,
                  ListView(
                    children: [
                      Text(
                        'Welcome To ${widget.placeDetail.placeName}',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            letterSpacing: -1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.placeDetail.detail,
                        maxLines: !isReadingInDetail ? 3 : 100,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.black54,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isReadingInDetail = !isReadingInDetail;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            !isReadingInDetail ? 'Read More' : 'Read Less',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Entertainment',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/arrow2.png',
                            width: 60,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FadeAnimation(
                              1.6,
                              optionMaker('Attractions', Icons.visibility,
                                  Colors.red, Colors.red.withGreen(80))),
                          SizedBox(width: 5),
                          FadeAnimation(
                              1.65,
                              optionMaker('ToDo', Icons.check_box,
                                  Colors.blue[900], Colors.blue[900])),
                          SizedBox(width: 5),
                          FadeAnimation(
                              1.7,
                              optionMaker('Experiencies', Icons.fireplace,
                                  Colors.yellow, Colors.yellow[800])),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          FadeAnimation(
                              1.6,
                              optionMaker('Places', Icons.image_outlined,
                                  Colors.orange, Colors.deepOrange)),
                          SizedBox(width: 5),
                          FadeAnimation(
                              1.65,
                              optionMaker('Hotels', Icons.hotel, Colors.blue,
                                  Colors.blue[700])),
                          SizedBox(width: 5),
                          FadeAnimation(
                              1.7,
                              optionMaker('Restaurants', Icons.local_restaurant,
                                  Colors.pink, Colors.pink[800])),
                          SizedBox(width: 5),
                          FadeAnimation(
                              1.8,
                              optionMaker('Bars', Icons.local_drink,
                                  Colors.lightGreen, Colors.green))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          favoriteIcon(isReadingInDetail),
        ],
      ),
    );
  }

  Container optionMaker(
      String name, IconData icon, Color containerColor, Color iconColor) {
    return Container(
      height: 85,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black26)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: containerColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 40,
            width: 40,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  AnimatedPositioned favoriteIcon(bool isReadingInDetail) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: !isReadingInDetail ? 330 : 70,
      left: widget.size.width / 2 - 30,
      child: FadeAnimation(
        1.2,
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black26)],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
