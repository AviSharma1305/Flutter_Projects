
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_bakery_store/themes.dart';

AppBar detailsAppBar() {
  return AppBar(
    backgroundColor: CombColr,
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/share (1).svg"),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset("assets/icons/more (1).svg"),
        onPressed: () {},
      ),
    ],
  );
}
