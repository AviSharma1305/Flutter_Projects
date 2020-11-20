import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_bakery_store/themes.dart';

class ProductCard extends StatelessWidget {
  final String title, svgSrc;
  final Function press;
  const ProductCard({
    Key key,
    this.title,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 10,
              color: ksecond,
            ),
          ]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    gradient: kprime,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    svgSrc,
                    width: size.width * 0.18,
                  ),
                ),
                Text(title,
                style: TextStyle(
                  color: Color(0xFFF50808),
                  fontSize: 18,
                ),),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}