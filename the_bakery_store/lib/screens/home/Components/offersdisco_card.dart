import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_bakery_store/themes.dart';

class OffersDisco extends StatelessWidget {
  const OffersDisco({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Offers & Discounts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: TextCol,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/images.jpg"),
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: kprime
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SvgPicture.asset("assets/icons/milkshake.svg"),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: kprime2,
                            ),
                            children: [
                              TextSpan(
                                text: "Get Discount of\n",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "30%\n",
                                style: TextStyle(
                                  fontSize: 43,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "on your first order\n",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
