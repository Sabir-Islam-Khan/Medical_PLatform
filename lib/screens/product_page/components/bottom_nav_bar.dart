import 'package:flutter/material.dart';
import 'package:shrink/screens/product_page/components/buttons.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget productBottomNaVBar(BuildContext context, int proID, int cost) {
  return Container(
    height: ScreenSize.height * 0.08,
    width: ScreenSize.width * 1,
    color: globalColor_13DarkBlue,
    child: Center(
      child: Row(
        children: [
          SizedBox(
            width: ScreenSize.width * 0.57,
          ),
          addToCart(context, proID, cost),
        ],
      ),
    ),
  );
}
