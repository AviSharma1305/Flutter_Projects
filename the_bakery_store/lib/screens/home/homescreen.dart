import 'package:flutter/material.dart';
import 'package:the_bakery_store/Components/bottom_nav.dart';
import 'package:the_bakery_store/screens/home/Components/body.dart';
import 'Components/app_Bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}