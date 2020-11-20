
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../../themes.dart';

Row shopNam({String name}) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.location_on,
        color: CombColr,
      ),
      SizedBox(width: 10),
      Text(name),
    ],
  );
}


class TitlePriceRate extends StatelessWidget {
  final int price, numReviews;
  final double ratings;
  final String name;
  final RatingChangeCallback onRatingChanged;
  const TitlePriceRate({
    Key key,
    this.price,
    this.numReviews,
    this.ratings,
    this.name,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      borderColor: CombColr,
                      rating: ratings,
                      color: CombColr,
                      onRated: onRatingChanged,
                    ),
                    SizedBox(width: 10),
                    Text("$numReviews reviews"),
                  ],
                ),
              ],
            ),
          ),
          priceTag(context, price: price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context,{int price}) {
    return ClipPath(
          clipper: PricerCliper(),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            height: 65,
            width: 65,
            color: CombColr,
            child: Text(
              "\$$price",
              style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignHeight = 20;
    path.lineTo(0, size.height - ignHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignHeight);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}