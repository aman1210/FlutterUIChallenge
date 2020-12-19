import 'package:flutter/material.dart';
import 'package:matrix4_test/rotatingCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rotating Animation'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RotatingCard())),
      ),
    );
  }
}
