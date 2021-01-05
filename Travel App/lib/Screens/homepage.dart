import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:travel_app/widgets/background.dart';
import 'package:travel_app/widgets/homescreenAppBar.dart';
import 'package:travel_app/widgets/imageCard.dart';
import 'package:travel_app/widgets/placeCounter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentImage = 'assets/images/varanasi1.jpg';
  var currentIndex = 0;
  var currentCountry = 0;

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
              countryList(size),
              CarouselSlider.builder(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  aspectRatio: 3 / 4,
                  height: 500,
                  viewportFraction: 0.8,
                  pageSnapping: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentImage = images[index];
                      currentIndex = index;
                    });
                  },
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ImageCard(size: size, image: images[index]);
                },
              ),
              SizedBox(
                height: 20,
              ),
              PlaceCounter(currentIndex: currentIndex),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 34),
                width: size.width,
                height: 3,
                color: Colors.white30,
              ),
              Container(
                height: 60,
                width: size.width - 34,
                margin: const EdgeInsets.only(left: 26, top: 8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Varanasi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container countryList(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(left: 16),
      width: size.width,
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              currentCountry == index
                  ? Icon(
                      CupertinoIcons.arrow_down,
                      size: 16,
                      color: Colors.white,
                    )
                  : SizedBox(
                      height: 16,
                    ),
              buildCountry(countries[index], index),
            ],
          );
        },
        itemCount: countries.length,
      ),
    );
  }

  InkWell buildCountry(String name, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentCountry = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          name,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
