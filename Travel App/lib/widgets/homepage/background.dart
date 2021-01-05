import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImages extends StatefulWidget {
  const BackgroundImages({
    Key key,
    @required this.size,
    @required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  _BackgroundImagesState createState() => _BackgroundImagesState();
}

class _BackgroundImagesState extends State<BackgroundImages>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(curve: Curves.easeIn, parent: controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        height: widget.size.height,
        width: widget.size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
