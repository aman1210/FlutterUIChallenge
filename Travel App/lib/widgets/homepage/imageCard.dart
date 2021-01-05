import 'package:flutter/material.dart';
import 'package:travel_app/Screens/placeDetail.dart';
import '../../Screens/homepage.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key key, @required this.size, @required this.placeDetail})
      : super(key: key);

  final Size size;
  final PlaceDetail placeDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: placeDetail.img,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(placeDetail, size),
          ));
        },
        child: Container(
          width: size.width,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                placeDetail.img,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black38,
                offset: Offset(6, 6),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 27),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  stops: [
                    0.5,
                    0.9
                  ]),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Text(
                    placeDetail.placeName,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Text(
                    placeDetail.desc,
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Discover Place',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/arrow.png',
                      width: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
