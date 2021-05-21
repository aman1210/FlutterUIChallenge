import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FigmaChallenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme().copyWith(
          headline1: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xff545454)),
          bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Color(0xff545454)),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Map<String, String>> _list = [
    {
      'image': 'assets/images/c1i1.png',
      'content': 'Practice with real exercices and projects for your portfolio',
      'title': 'Learn',
    },
    {
      'image': 'assets/images/c1i2.png',
      'content':
          'Learn how to code great video game interfaces for different devices ',
      'title': 'Code',
    },
    {
      'image': 'assets/images/c1i3.png',
      'content':
          'Collect case studies of the best teachers in the game industry',
      'title': 'Collect',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var backgroundCircle = AnimatedPositioned(
      bottom: index == 1 ? -300 : -200,
      left: index == 0
          ? -350
          : index == 1
              ? -100
              : 100,
      child: Container(
        width: size.height * 0.7,
        height: size.height * 0.7,
        decoration: BoxDecoration(
          color: index == 0
              ? Colors.green.withOpacity(0.1)
              : index == 1
                  ? Colors.deepPurple.withOpacity(0.1)
                  : Colors.pink.withOpacity(0.1),
          borderRadius: BorderRadius.circular(size.height),
        ),
      ),
      duration: Duration(milliseconds: 1000),
    );
    var bottomButton = Positioned(
      bottom: 20,
      left: (size.width / 2) - ((size.width * 0.55) / 2),
      child: InkWell(
        onTap: () {
          if (index < 2) {
            setState(() {
              index++;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          width: size.width * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: index == 0
                ? Colors.green
                : index == 1
                    ? Colors.deepPurple
                    : Colors.pink,
          ),
          child: Text(
            'GET STARTED',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.8,
                color: Colors.white,
                height: 1),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            backgroundCircle,
            ..._list.map((e) {
              return OnboardingDetail(
                e: e,
                index: index,
                size: size,
                childIndex: _list.indexOf(e),
              );
            }).toList(),
            PageIndicator(size: size, index: index),
            bottomButton,
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 100,
        left: (size.width / 2) - 50,
        child: Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: 15,
                width: index == 0 ? 40 : 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: index == 0 ? Colors.grey : Colors.transparent,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: 15,
                width: index == 1 ? 40 : 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: index == 1 ? Colors.grey : Colors.transparent,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: 15,
                width: index == 2 ? 40 : 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: index == 2 ? Colors.grey : Colors.transparent,
                ),
              ),
            ],
          ),
        ));
  }
}

class OnboardingDetail extends StatelessWidget {
  const OnboardingDetail({
    Key? key,
    required this.e,
    required this.index,
    required this.childIndex,
    required this.size,
  });

  final Map<String, String> e;
  final int index;
  final int childIndex;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: childIndex == index ? 1 : 0,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedPositioned(
                    bottom: index == 1
                        ? 60
                        : index == 0
                            ? -50
                            : 0,
                    left: index == 0
                        ? -20
                        : index == 1
                            ? 0
                            : 80,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: index == 0
                              ? Colors.green.withOpacity(0.1)
                              : index == 1
                                  ? Colors.deepPurple.withOpacity(0.1)
                                  : Colors.pink.withOpacity(0.1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Image.asset(e['image']!),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              e['title']!,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: size.width * 0.5,
              child: Text(
                e['content']!,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeTitle extends StatelessWidget {
  const FadeTitle({
    Key? key,
    required this.widget,
    required this.index,
    required this.childIndex,
  });

  final Widget widget;
  final int index;
  final int childIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: childIndex == index ? 1 : 0,
                child: widget),
          ),
        ],
      ),
    );
  }
}
