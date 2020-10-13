import 'package:flutter/material.dart';
import 'screens/home_diary.dart';
import 'data/theme.dart';
import 'package:joyus_app/diary/services/sharedPref.dart';

class HomeDiary extends StatefulWidget {
  @override
  _HomeDiaryState createState() => _HomeDiaryState();
}

class _HomeDiaryState extends State<HomeDiary> {
  // ThemeData theme = appThemeLight;
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: theme,
      home: MyHomePage_Diary(title: 'Home', ),
    );
  }




}

