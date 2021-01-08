import 'package:flutter/material.dart';
import 'package:heartBeat_animation/widgets/beating.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height - 250,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.deepPurple, BlendMode.hardLight),
                image: AssetImage('assets/meditation.jpg'),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width,
                    // color: Colors.yellow,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Icon(Icons.menu, size: 28, color: Colors.white),
                        ),
                        Expanded(
                            child: Text(
                          'SoulFit',
                          style: TextStyle(color: Colors.white, fontSize: 36),
                          textAlign: TextAlign.center,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.notifications,
                              size: 28, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Beating(350, 0.2),
                ),
                Center(
                  child: Beating(250, 0.4),
                ),
                Center(
                  child: Beating(150, 0.6),
                ),
                Center(
                  child: Icon(
                    Icons.favorite,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, right: 8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Heart Rate',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    height: 3),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '84',
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.pink,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'BPM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 2.7,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 250,
            width: size.width,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
