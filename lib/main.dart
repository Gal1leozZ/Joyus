import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joyus_app/Screens/Welcome/welcome_screen.dart';
import 'package:joyus_app/constants.dart';

import 'griddashboard.dart';

void main() => runApp(MyApp());

 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joyus',
      theme: ThemeData(
        fontFamily: 'supermarket',
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}




