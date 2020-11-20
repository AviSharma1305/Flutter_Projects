import 'package:flutter/material.dart';
import 'package:the_bakery_store/screens/home/homescreen.dart';
import 'package:the_bakery_store/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bakery App',
      theme: ThemeData(
        primaryColor: kprime2,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(color: ksecond),
          body2: TextStyle(color: ksecond),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
