import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';

Widget splashScreen() {
  return Container(
    color: globalColor_13DarkBlue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 200,
        ),
        Image.asset("assets/logo/shrink_icon_compressed.png")
      ],
    ),
  );
}
