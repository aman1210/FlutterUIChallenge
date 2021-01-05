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
  var currentPlaces = 0;

  List<CountryDetail> countriesList = [
    new CountryDetail(
      name: 'India',
      places: [
        new PlaceDetail(
          placeName: 'Varanasi',
          img: 'assets/images/varanasi2.jpg',
          desc:
              'is a city in the northern Indian state of Uttar Pradesh dating to the 11th century B.C. Regarded as the spiritual capital of India',
          detail:
              'Varanasi, or Benaras, (also known as Kashi) is one of the oldest living cities in the world. Varanasi`s Prominence in Hindu mythology is virtually unrevealed. Mark Twain, the English author and literature, who was enthralled by the legend and sanctity of Benaras, once wrote : “Benaras is older than history, older than tradition, older even than legend and looks twice as old as all of them put together.",\n The land of Varanasi (Kashi) has been the ultimate pilgrimage spot for Hindus for ages. Hindus believe that one who is graced to die on the land of Varanasi would attain salvation and freedom from the cycle of birth and re-birth. Abode of Lord Shiva and Parvati, the origins of Varanasi are yet unknown. Ganges in Varanasi is believed to have the power to wash away the sins of mortals.',
        ),
        new PlaceDetail(
            placeName: 'Mumbai',
            desc:
                "Mumbai (formerly called Bombay) is a densely populated city on India’s west coast. A financial center, it's India's largest city.",
            img: 'assets/images/mumbai.jpg',
            detail:
                "Mumbai (Marathi: मुंबई) [35], a cosmopolitan metropolis, earlier known as Bombay, is the largest city in India and the capital of Maharashtra state. Mumbai was originally a conglomeration of seven islands on the Konkan coastline which over time were joined to form the island city of Bombay. The island was in turn joined with the neighboring island of Salsette to form Greater Bombay. The city has an estimated metropolitan population of 21 million (2005), making it one of the world's most populous cities.\nMumbai is undoubtedly the commercial capital of India and is one of the predominant port cities in the country. Mumbai's nature as the most eclectic and cosmopolitan Indian city is symbolized in the presence of Bollywood within the city, the centre of the globally-influential Hindi film and TV industries. It is also home to India's largest slum population.")
      ],
    ),
    new CountryDetail(
      name: 'Sweden',
      places: [
        new PlaceDetail(
            placeName: 'Gothenburg',
            img: 'assets/images/gothenburg.jpg',
            desc:
                "a major city in Sweden, is situated off the Göta älv river on the country's west coast.",
            detail:
                "Gothenburg is the second largest city in Sweden and the largest non-capital in the Nordic countries. It is beautifully situated on the west coast and has a population of 570,000 in the actual city and one million in the greater Gothenburg area.\n Everything is close by in Gothenburg. In fact, most things are within walking or cycling distance. The sea and several beaches are within a couple of kilometres from the city, as are extensive nature reserves and outdoor recreation areas. The beautiful archipelago with its many islands is a short trip away."),
      ],
    ),
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
                  height: 500,
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
                  return ImageCard(
                      size: size,
                      placeDetail: countriesList[currentCountry].places[index]);
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
        });
      },
      splashColor: Colors.white,
      child: Container(
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

class CountryDetail {
  final String name;
  final List<PlaceDetail> places;
  CountryDetail({this.name, this.places});
}

class PlaceDetail {
  final String placeName;
  final String img;
  final String desc;
  final String detail;

  PlaceDetail(
      {@required this.placeName,
      @required this.img,
      @required this.desc,
      @required this.detail});
}
