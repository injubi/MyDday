import 'package:flutter/material.dart';
import 'package:my_day/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}