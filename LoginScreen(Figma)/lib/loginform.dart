import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final bool isOpen;
  final Size size;
  LoginForm({
    required this.isOpen,
    required this.size,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showForm = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      onEnd: () {
        if (widget.isOpen) {
          showForm = true;
        } else {
          showForm = false;
        }
        setState(() {});
      },
      bottom: widget.isOpen ? 0 : -widget.size.height,
      child: ClipPath(
        clipper: LoginClipper(),
        child: Container(
          height: widget.size.height * 0.6,
          width: widget.size.width,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            opacity: showForm ? 1 : 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log in',
                  style: TextStyle(
                    fontFamily: 'SFPro',
                    color: Color(0xff3D0007),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: widget.size.height / 36,
                ),
                Text(
                  'Your email',
                  style: TextStyle(
                      fontFamily: 'SFCompact',
                      fontSize: 14,
                      color: Color(0xff3D0007)),
                ),
                TextFormField(
                  initialValue: 'john@wick.com',
                  style: TextStyle(
                      fontFamily: 'SFCompact',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff3F0108).withOpacity(0.5),
                      letterSpacing: 1.1,
                      height: 1.2),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xffECECEC),
                      ),
                    ),
                    prefixIcon: Image.asset(
                      'assets/images/mail 1.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.size.height / 36,
                ),
                Text(
                  'Your password',
                  style: TextStyle(
                      fontFamily: 'SFCompact',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff3D0007)),
                ),
                TextFormField(
                  initialValue: 'jdfkjnsd',
                  obscureText: true,
                  obscuringCharacter: '*',
                  style: TextStyle(
                      fontFamily: 'SFCompact',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff3F0108).withOpacity(0.5),
                      letterSpacing: 1.8),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xffECECEC),
                      ),
                    ),
                    prefixIcon: Image.asset(
                      'assets/images/access-key 1.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.size.height / 20,
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffFA6B74),
                              Color(0xffF89500),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset(0, 8),
                              color: Color(0xffD83131).withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'SFCompact',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 1.8),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.size.height / 9,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;
    path.moveTo(0, height / 8);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(width - width / 18, 0);
    path.quadraticBezierTo(width - width / 4, 0, width - width / 4, height / 8);
    path.quadraticBezierTo(
        width - width / 4, height / 6, width - width / 2.8, height / 8);
    path.quadraticBezierTo(width / 2 - width / 3, -height / 12, 0, height / 8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
