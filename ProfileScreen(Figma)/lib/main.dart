import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/profileScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Figma Challenge 4',
      theme: ThemeData(
        fontFamily: 'SFPro',
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}
