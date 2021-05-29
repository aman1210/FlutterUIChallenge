import 'package:flutter/material.dart';

import 'lastArticleItem.dart';

class LastArticles extends StatelessWidget {
  LastArticles({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  final List<String> _articlesImages = [
    'assets/images/modern_art2.jpg',
    'assets/images/syndrome.jpg',
    'assets/images/modern_art.jpg',
    'assets/images/street_art.jpg',
    'assets/images/street_art2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return LastArticlesItem(
            width: width,
            height: height,
            image: _articlesImages[index % 5],
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
