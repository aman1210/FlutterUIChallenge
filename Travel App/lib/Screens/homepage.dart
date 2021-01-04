import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/widgets/background.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var currentImage = 'assets/images/varanasi1.jpg';

    List<String> images = [
      'assets/images/varanasi1.jpg',
      'assets/images/varanasi2.jpg',
      'assets/images/varanasi3.jpg',
      'assets/images/varanasi4.jpg',
      'assets/images/varanasi5.jpg',
    ];

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImages(size: size, image: currentImage),
          Center(
            child: CarouselSlider.builder(
              carouselController: ScrollController(),
              options: CarouselOptions(
                aspectRatio: 9 / 16,
                height: 500,
                viewportFraction: 0.85,
                pageSnapping: true,
                enlargeCenterPage: true,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  width: size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          images[index],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black38,
                          offset: Offset(4, 4),
                        ),
                      ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
