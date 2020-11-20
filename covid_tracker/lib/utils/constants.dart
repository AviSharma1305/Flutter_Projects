import 'package:flutter/material.dart';

Color kPrimary = Color(0xFF166DE0);
Color kConfirmed = Color(0xFFFF1242);
Color kActive = Color(0xFF017BFF);
Color kRecovered = Color(0xFF29A746);
Color kDeath = Color(0xFF6D757D);
Color kColor = Colors.black;
Color kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
Color kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);
Color kTitleTextColor = Color(0xFF303030);

LinearGradient kGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.grey[300],
    Colors.grey[100],
  ],
);

const kHeadingTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.';