import 'package:flutter/material.dart';
import 'package:shoes_store_ui/screens/shoeScreen.dart';
import 'package:shoes_store_ui/widgets/fadeAndSlideAnimation.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    Key key,
    @required this.images,
  }) : super(key: key);

  final String images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Hero(
          tag: images,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoeScreen(images),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 240,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    images,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeAnimation(
                        1,
                        Text(
                          'Sneakers',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    child: FadeAnimation(
                      1.2,
                      Text(
                        'Nike',
                        style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: FadeAnimation(
                      1.4,
                      Text(
                        '100\$',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
