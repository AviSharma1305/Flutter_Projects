import 'package:flutter/material.dart';
import 'package:the_bakery_store/themes.dart';

class CatogeryList extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function press;
  const CatogeryList({
    Key key,
    this.title,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: isActive ?
              TextStyle(
                color: TextCol,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )
                  : TextStyle(fontSize: 20),
            ),
            if(isActive) Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 2,
              width: 22,
              decoration: BoxDecoration(
                gradient: kprime,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}