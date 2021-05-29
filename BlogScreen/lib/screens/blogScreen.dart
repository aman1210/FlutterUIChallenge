import 'package:figma_challenge_6/styles.dart';
import 'package:figma_challenge_6/widgets/listArticles.dart';
import 'package:figma_challenge_6/widgets/modernArtArticleItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/appBar.dart';

class BlogScreen extends StatelessWidget {
  static List<String> _articlesImages = [
    'assets/images/modern_art.jpg',
    'assets/images/street_art.jpg',
    'assets/images/street_art2.jpg',
    'assets/images/modern_art2.jpg',
    'assets/images/syndrome.jpg',
  ];

  Widget modernArtArticles(double width, String image, int index) {
    double height = width > 700 ? 300 : 105;
    return Container(
      width: width,
      color: Colors.transparent,
      child: ModernArtArticleItem(image: image, index: index, height: height),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            var height = constraints.maxHeight;
            var dateAndMainTitle = Container(
              color: Colors.white,
              padding: kMainPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Last Articles',
                    style: kLastArticlesMainTitle,
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    'Today, March 21',
                    style: kDateText,
                  ),
                ],
              ),
            );
            // var modernArtArticles = Container(
            //   // padding: kMainPadding,
            //   width: width,
            //   decoration: kModernArtSection,
            //   child: ModernArtArticles(),
            // );
            var heading = Container(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
              child: Text(
                'Modern Art',
                style: kMorderArtTitle,
              ),
            );
            return Container(
              height: height,
              width: width,
              color: Colors.blue,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlogAppBar(),
                    dateAndMainTitle,
                    LastArticles(
                        height: width > 700 ? height * 0.6 : height * 0.34,
                        width: width),
                    // modernArtArticles
                    heading,

                    ..._articlesImages
                        .map((e) => modernArtArticles(
                            width, e, _articlesImages.indexOf(e)))
                        .toList()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
