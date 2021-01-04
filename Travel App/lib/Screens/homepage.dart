import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/widgets/background.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentImage = 'assets/images/varanasi1.jpg';

  List<String> images = [
    'assets/images/varanasi1.jpg',
    'assets/images/varanasi2.jpg',
    'assets/images/varanasi3.jpg',
    'assets/images/varanasi4.jpg',
    'assets/images/varanasi5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImages(
            image: currentImage,
            size: size,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icon.png',
                          height: 30,
                        ),
                        Text(
                          'travello',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Poppins'),
                        )
                      ],
                    ),
                    Icon(
                      CupertinoIcons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  aspectRatio: 9 / 16,
                  height: 500,
                  viewportFraction: 0.8,
                  pageSnapping: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentImage = images[index];
                    });
                  },
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
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
            ],
          ),
        ],
      ),
    );
  }
}
