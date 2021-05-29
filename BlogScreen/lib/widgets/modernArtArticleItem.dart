import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles.dart';

class ModernArtArticleItem extends StatelessWidget {
  const ModernArtArticleItem({
    Key? key,
    required this.image,
    required this.index,
    required this.height,
  }) : super(key: key);

  final double height;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    var authorAndCommentContainer = Row(
      children: [
        articleAuthorAndComments('assets/images/face.svg', 'Frank Rimes'),
        Expanded(child: SizedBox()),
        articleAuthorAndComments(
          'assets/images/comment.svg',
          '8 comments',
        ),
      ],
    );
    var articleTitle = Text(
      'About the new art deco for designers and artists',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
    var categoryContainer = Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index != 0 ? Color(0xff73E5FE) : Color(0xffFFDE33),
          ),
        ),
        Text(
          index == 0 ? 'Modern Art' : 'Street Art',
          style: TextStyle(
              color: index != 0 ? Color(0xff73E5FE) : Color(0xffFFDE33),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Row(
        children: [
          Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
              child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryContainer,
                articleTitle,
                authorAndCommentContainer,
              ],
            ),
          )),
        ],
      ),
    );
  }

  Row articleAuthorAndComments(String image, String title) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          color: Colors.white54,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: kAuthorAndComment.copyWith(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
