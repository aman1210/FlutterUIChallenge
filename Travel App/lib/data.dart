import 'package:flutter/material.dart';

class Data {
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
              "Mumbai (Marathi: मुंबई), a cosmopolitan metropolis, earlier known as Bombay, is the largest city in India and the capital of Maharashtra state. Mumbai was originally a conglomeration of seven islands on the Konkan coastline which over time were joined to form the island city of Bombay. The island was in turn joined with the neighboring island of Salsette to form Greater Bombay. The city has an estimated metropolitan population of 21 million (2005), making it one of the world's most populous cities.\nMumbai is undoubtedly the commercial capital of India and is one of the predominant port cities in the country. Mumbai's nature as the most eclectic and cosmopolitan Indian city is symbolized in the presence of Bollywood within the city, the centre of the globally-influential Hindi film and TV industries. It is also home to India's largest slum population.",
        ),
        new PlaceDetail(
          placeName: 'Delhi',
          img: 'assets/images/delhi.jpg',
          desc:
              'New Delhi is jointly administered by the federal government of India and the local government of Delhi, and serves as the capital of the nation as well as the NCT of Delhi.',
          detail:
              "Delhi, India’s capital territory, is a massive metropolitan area in the country’s north. In Old Delhi, a neighborhood dating to the 1600s, stands the imposing Mughal-era Red Fort, a symbol of India, and the sprawling Jama Masjid mosque, whose courtyard accommodates 25,000 people. Nearby is Chandni Chowk, a vibrant bazaar filled with food carts, sweets shops and spice stalls.",
        ),
        new PlaceDetail(
          placeName: 'Jammu and Kashmir',
          desc:
              "Jammu and Kashmir, union territory of India, located in the northern part of the Indian subcontinent in the vicinity of the Karakoram and westernmost Himalayan mountain ranges.",
          img: 'assets/images/jk.jpg',
          detail:
              "Jammu and Kashmir is home to several valleys such as the Kashmir Valley, Chenab Valley, Sindh Valley and Lidder Valley. Some major tourist attractions in Jammu and Kashmir are Srinagar, the Mughal Gardens, Gulmarg, Pahalgam, Patnitop and Jammu. Every year, thousands of Hindu pilgrims visit holy shrines of Vaishno Devi and Amarnath which has had significant impact on the state's economy.\n The Kashmir valley is one of the top tourist destinations of India.[60] Gulmarg, one of the most popular ski resort destinations in India, is also home to the world's highest green golf course. The decrease in violence in the state has boosted the state's economy, specifically tourism.",
        ),
        new PlaceDetail(placeName: 'Kedarnath'),
        new PlaceDetail(placeName: 'Rameshawaram')
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
              "Gothenburg is the second largest city in Sweden and the largest non-capital in the Nordic countries. It is beautifully situated on the west coast and has a population of 570,000 in the actual city and one million in the greater Gothenburg area.\n Everything is close by in Gothenburg. In fact, most things are within walking or cycling distance. The sea and several beaches are within a couple of kilometres from the city, as are extensive nature reserves and outdoor recreation areas. The beautiful archipelago with its many islands is a short trip away.",
        ),
        new PlaceDetail(
          placeName: 'Uppsala',
          img: 'assets/images/uppsala.jpg',
          desc:
              "Uppsala is a city near Stockholm, in Sweden. It's known for Uppsala University, founded in the 15th century. The original university building, Gustavianum, is now a museum housing the Augsburg Art Cabinet, an elaborate, 17th-century cabinet of curiosities.",
          detail:
              "Uppsala is one of Sweden’s oldest cities. It was known as Östra Aros up until the 13th century, when the name Uppsala took over. Today, Uppsala is one of Sweden’s four major cities and is world renowned for its universities, its magnificent cathedral and the legacy of Carl Linnaeus, among other things.",
        ),
        new PlaceDetail(placeName: 'Visby'),
        new PlaceDetail(placeName: 'Västerås'),
        new PlaceDetail(placeName: 'Helsingborg'),
      ],
    ),
    new CountryDetail(name: 'Ireland'),
    new CountryDetail(name: 'Thailand'),
    new CountryDetail(name: 'France'),
  ];
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

  PlaceDetail({@required this.placeName, this.img, this.desc, this.detail});
}
