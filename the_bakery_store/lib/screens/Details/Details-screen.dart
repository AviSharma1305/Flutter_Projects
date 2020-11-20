import 'package:flutter/material.dart';
import 'package:the_bakery_store/Components/bottom_nav.dart';
import 'Components/app_bar.dart';
import 'Components/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}

