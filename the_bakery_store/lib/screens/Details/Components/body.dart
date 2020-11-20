import 'package:flutter/material.dart';
import 'package:the_bakery_store/screens/Details/Components/product_img.dart';
import 'package:the_bakery_store/screens/Details/Components/title_price_rate.dart';
import 'package:the_bakery_store/themes.dart';
import 'order_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: ProductImage(
            imgSrc: "assets/images/pexels-photo-3012214.jpeg",

          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black,
            child: ProductInfo(),
          ),
        ),
      ],
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopNam(name: "BakeryStore"),
          TitlePriceRate(
            name: "Black Forest",
            price: 15,
            ratings: 4,
            numReviews: 24,
            onRatingChanged: (value) {},
          ),
          Text(
            "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bugs faster. Experience sub-second reload times without losing state on emulators, simulators, and hardware.",
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: size.height * 0.1),
          OrderButton(size: size,
            press: () {},
          ),
        ],
      ),
    );
  }
}
