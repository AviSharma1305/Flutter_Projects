import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_bakery_store/themes.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: Theme.of(context).textTheme.title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "Bakery",
              style: TextStyle(
                  color: ksecond
              ),
            ),
            TextSpan(
              text: "Store",style: TextStyle(
              color: kprime2,
            ),
            ),
          ]
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {},
      ),
    ],
  );
}