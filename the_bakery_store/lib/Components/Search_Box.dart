import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../themes.dart';

class Search_Box extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const Search_Box({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: ksecond.withOpacity(0.32),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Search Here",
          hintStyle: TextStyle(
            color: ksecond,
          ),
        ),
      ),
    );
  }
}