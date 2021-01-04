import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/widgets/background.dart';
import 'package:travel_app/widgets/homescreenAppBar.dart';

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

  List<String> countries = [
    "India",
    "Sweden",
    "Italy",
    "Ireland",
    "Vietnam",
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
              HomeScreenAppBar(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(left: 16),
                width: size.width,
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildCountry(countries[index]);
                  },
                  itemCount: countries.length,
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

  Padding buildCountry(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        name,
        style:
            TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Poppins'),
      ),
    );
  }
}
