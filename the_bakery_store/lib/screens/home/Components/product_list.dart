import 'package:flutter/material.dart';
import 'package:the_bakery_store/screens/Details/Details-screen.dart';
import 'package:the_bakery_store/screens/home/Components/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ProductCard(
            svgSrc: "assets/icons/cake.svg",
            title: "Birthday Cakes",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen()
                  )
              );
            },
          ),
          ProductCard(
            svgSrc: "assets/icons/wedding-cake.svg",
            title: "Wedding Cakes",
            press: () {},
          ),
          ProductCard(
            svgSrc: "assets/icons/wedding-cake.svg",
            title: "Wedding Cakes",
            press: () {},
          ),
        ],
      ),
    );
  }
}