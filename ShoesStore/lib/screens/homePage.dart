import 'package:flutter/material.dart';
import 'package:shoes_store_ui/widgets/fadeAndSlideAnimation.dart';
import 'package:shoes_store_ui/widgets/hometopBar.dart';
import 'package:shoes_store_ui/widgets/hometabBar.dart';
import 'package:shoes_store_ui/widgets/shoeCard.dart';

class HomePage extends StatelessWidget {
  final images = [
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            TabBarOption(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => FadeAnimation(
                    (1 + 0.5 * index), ShoeCard(images: images[index])),
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
