import 'dart:math';

import 'package:WaveyLoginScreen/loginForm.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  ScrollController _scrollController;
  var down = false;
  var animatingSlide = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
    _animation = Tween<double>(begin: -500, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _scrollController = ScrollController();
  }

  slideDown(double height) {
    _scrollController.animateTo(2600 + height,
        curve: Curves.easeInCubic, duration: Duration(milliseconds: 500));
  }

  slideUp() {
    _scrollController.animateTo(0,
        curve: Curves.easeInOutCubic, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: size.height - 320,
                width: 340,
                child: LoginForm(
                  scrollFunction: slideDown,
                  signup: false,
                ),
              ),
              Waves(animation: _animation),
              Container(
                padding: const EdgeInsets.all(0),
                height: 2500,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.83),
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Colors.deepPurple[700],
                      Colors.deepPurple[800],
                      Colors.deepPurple[900],
                      Colors.deepPurple[900],
                      Colors.deepPurple[800],
                      Colors.deepPurple[700],
                      Colors.deepPurple,
                    ],
                    stops: [0.1, 0.2, 0.3, 0.5, 0.7, 0.8, 0.9, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi,
                child: Waves(
                  animation: _animation,
                ),
              ),
              Container(
                height: size.height - 320,
                width: 340,
                child: LoginForm(
                  scrollFunction: slideUp,
                  signup: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Waves extends StatelessWidget {
  const Waves({
    Key key,
    @required Animation<double> animation,
  })  : _animation = animation,
        super(key: key);

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      height: 350,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        overflow: Overflow.clip,
        children: [
          Positioned(
            bottom: -10,
            left: _animation.value - 60,
            child: ClipPath(
              clipper: WaveClip(),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width: 1000,
                  height: 310,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: _animation.value,
            child: ClipPath(
              clipper: WaveClip(),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 1000,
                  height: 300,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -25,
            left: _animation.value - 80,
            child: ClipPath(
              clipper: WaveClip(),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 1000,
                  height: 300,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 40);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40);

    for (var i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            -10.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 260);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 200,
            size.width - ((i + 1) * size.width / 8),
            size.height - 260);
      }
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
