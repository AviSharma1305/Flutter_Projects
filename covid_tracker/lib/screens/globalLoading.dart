import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GLobalLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            loadingCard(),
            loadingCard(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            loadingCard(),
            loadingCard(),
          ],
        )
      ],
    );
  }

  Widget loadingCard() {
    return Container(
      height: 160,
      width: 150,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 15,
              color: kActiveShadowColor,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(
                width: 140,
                height: 26,
                color: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 80,
                height: 14,
                color: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 140,
                height: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
