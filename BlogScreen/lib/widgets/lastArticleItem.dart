import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles.dart';

class LastArticlesItem extends StatelessWidget {
  const LastArticlesItem({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    var articleAuthorAndComment = Row(
      children: [
        authorAndComment('assets/images/face.svg', 'Alan Moore'),
        Expanded(child: SizedBox()),
        authorAndComment('assets/images/comment.svg', '5 Comments'),
      ],
    );
    var articleImage = Container(
      height: width < 700 ? height * 0.6 : height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover),
      ),
    );
    var articleTitle = Text(
      'Dealing with imposter syndrome',
      style: kLastArticlesListItemTitle,
    );
    return Container(
      width: width > 700 ? width * 0.45 : width * 0.6,
      child: Container(
        padding: const EdgeInsets.only(left: 26, top: 12),
        width: width > 700 ? width * 0.45 : width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            articleImage,
            SizedBox(
              height: height * 0.05,
            ),
            articleTitle,
            SizedBox(
              height: height * 0.02,
            ),
            articleAuthorAndComment,
          ],
        ),
      ),
    );
  }

  Row authorAndComment(String image, String title) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          color: kAuthorAndComment.color,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: kAuthorAndComment,
        ),
      ],
    );
  }
}
