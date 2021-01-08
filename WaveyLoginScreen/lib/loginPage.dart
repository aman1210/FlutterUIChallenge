import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

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
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 250,
                width: 340,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            height: 350,
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: _animation.value - 50,
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
                  bottom: -15,
                  left: _animation.value - 100,
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
