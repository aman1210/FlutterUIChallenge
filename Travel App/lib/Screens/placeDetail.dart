import 'package:flutter/material.dart';
import 'package:travel_app/widgets/fadeAndSlideAnimation.dart';

import './homepage.dart';

class PlaceDetailScreen extends StatelessWidget {
  PlaceDetailScreen(this.placeDetail, this.size);
  final PlaceDetail placeDetail;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: placeDetail.img,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(placeDetail.img), fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Text(
                        placeDetail.placeName,
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
          FadeAnimation(
            1,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                alignment: Alignment.bottomCenter,
                height: size.height - 360,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: FadeAnimation(
                  1.3,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome To ${placeDetail.placeName}',
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
                        placeDetail.detail,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 330,
            left: size.width / 2 - 30,
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
          ),
        ],
      ),
    );
  }
}
