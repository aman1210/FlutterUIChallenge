import 'package:figma_challenge_3/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figma Challenge 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xff000417).withOpacity(0.92),
        fontFamily: 'SFPro',
        brightness: Brightness.dark,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              bodyText1: TextStyle(fontSize: 18, color: Colors.white),
              bodyText2: TextStyle(fontSize: 14, color: Color(0xffD8D8D8)),
              subtitle1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: Color(0xffD8D8D8)),
              subtitle2: TextStyle(fontSize: 14, color: Color(0xff7077A0)),
              button: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
      ),
      home: SignUpScreen(),
    );
  }
}
