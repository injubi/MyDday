import 'package:flutter/material.dart';
import 'package:my_day/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'pretendard',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'pretendard',
            fontSize: 80.0,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'pretendard',
            fontSize: 30.0,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontFamily: 'pretendard',
            fontSize: 20.0,
          ),
        ),
      ),
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/img/sky.jpg"), fit: BoxFit.cover)),
          child: HomeScreen()),
    ),
  );
}
