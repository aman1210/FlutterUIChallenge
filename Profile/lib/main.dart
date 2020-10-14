import 'package:flutter/material.dart';

import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:uiChallengeProfile/header/profileHeader.dart';
import 'package:uiChallengeProfile/options.dart';
import 'package:uiChallengeProfile/quickActions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [ProfileHeader(), QuickACtions(), Options()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.bookmark), label: "Saved"),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.thumbs_up), label: "Liked"),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.user), label: "Profile"),
        ],
        currentIndex: 3,
        elevation: 10,
        onTap: (value) {},
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        iconSize: 28.0,
      ),
    );
  }
}
