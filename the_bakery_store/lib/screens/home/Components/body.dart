import 'package:flutter/material.dart';
import 'package:the_bakery_store/Components/Search_Box.dart';
import 'package:the_bakery_store/screens/home/Components/product_list.dart';
import 'Categorylist.dart';
import 'offersdisco_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Search_Box(
              onChanged: (value) {},
            ),
            Categorylist(),
            ProductList(),
            OffersDisco(),
          ],
        ),
      ],
    );
  }
}









