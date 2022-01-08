import 'package:flutter/material.dart';
import 'package:shrink/screens/cart/components/buttons.dart';
import 'package:shrink/variables/globalVar.dart';

Widget globalAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: SizedBox(),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ScreenSize.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenSize.width * 0.03,
            ),
            child: BackArrow(),
          ),
        ],
      ),
    ),
  );
}
