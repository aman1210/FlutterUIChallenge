import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:travel_app/widgets/homepage/background.dart';
import 'package:travel_app/widgets/fadeAndSlideAnimation.dart';
import 'package:travel_app/widgets/homepage/homescreenAppBar.dart';
import 'package:travel_app/widgets/homepage/imageCard.dart';
import 'package:travel_app/widgets/homepage/placeCounter.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentImage = 'assets/images/varanasi1.jpg';
  var currentIndex = 0;
  var currentCountry = 0;
  var currentPlaces = 0;

  List<CountryDetail> countriesList = Data().countriesList;

  List<String> countries = [
    "India",
    "Sweden",
    "Italy",
    "Ireland",
    "Vietnam",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImages(
            image: countriesList[currentCountry].places[currentIndex].img,
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
                  height: 520,
                  viewportFraction: 0.8,
                  pageSnapping: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemCount: countriesList[currentCountry].places.length,
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    (1 + 0.5 * index),
                    ImageCard(
                        size: size,
                        placeDetail:
                            countriesList[currentCountry].places[index]),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              PlaceCounter(
                currentIndex: currentIndex,
                length: countriesList[currentCountry].places.length,
              ),
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
                  itemCount: countriesList[currentCountry].places.length,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        countriesList[currentCountry].places[index].placeName,
                        style: TextStyle(
                            color: index == currentIndex
                                ? Colors.white
                                : Colors.white54,
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
      margin: const EdgeInsets.only(left: 24),
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
              buildCountry(countriesList[index].name, index),
            ],
          );
        },
        itemCount: countriesList.length,
      ),
    );
  }

  InkWell buildCountry(String name, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentCountry = index;
          currentIndex = 0;
        });
      },
      splashColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          name,
          style: TextStyle(
              fontSize: 16,
              color: index == currentCountry ? Colors.white : Colors.white54,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
