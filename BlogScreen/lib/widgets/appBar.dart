import 'package:figma_challenge_6/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogAppBar extends StatelessWidget {
  const BlogAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/menu.svg',
              height: 24,
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            splashRadius: Material.defaultSplashRadius,
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.blue,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
