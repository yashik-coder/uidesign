import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uidesign/screens/Landing_Page.dart';
import 'package:uidesign/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(
       primaryColor: COLOR_WHITE,
       accentColor: COLOR_DARK_BLUE,
       textTheme: screenWidth < 600 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
       fontFamily: 'Montserrat',
      ),
      home: Landingpage(),
    );
  }
}
