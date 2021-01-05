import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    @required this.size,
    @required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black54,
            offset: Offset(0, 4),
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
            Text(
              'Varanasi',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'is a city in the northern Indian state of Uttar Pradesh dating to the 11th century B.C. Regarded as the spiritual capital of India',
              style: TextStyle(
                  color: Colors.white70, fontFamily: 'Poppins', fontSize: 12),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Discover Place',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
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
    );
  }
}
