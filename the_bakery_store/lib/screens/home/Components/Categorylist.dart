import 'package:flutter/material.dart';
import 'CatogeryList.dart';

class Categorylist extends StatelessWidget {
  const Categorylist({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CatogeryList(
            title: "Cakes",
            isActive: true,
            press: () {},
          ),
          CatogeryList(
            title: "Ice Cream",
            press: () {},
          ),
          CatogeryList(
            title: "Shakes",
            press: () {},
          ),
          CatogeryList(
            title: "Specials",
            press: () {},
          ),
        ],
      ),
    );
  }
}