import 'dart:ui';

import 'package:figma_challenge_6/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'modernArtArticleItem.dart';

class ModernArtArticles extends StatelessWidget {
  const ModernArtArticles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heading = Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
      child: Text(
        'Modern Art',
        style: kMorderArtTitle,
      ),
    );
    var articles = ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // tileMode: TileMode.clamp,
            colors: <Color>[
              Colors.transparent,
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.6),
            ],
            stops: [
              0.78,
              0.88,
              1
            ]).createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        height: 105,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        // child: ListView.builder(
        //   itemBuilder: (context, index) => ModernArtArticleItem(
        //     image: _articlesImages[index % 5],
        //     index: index,
        //   ),
        //   itemCount: 100,
        // ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading,
        articles,
      ],
    );
  }
}
