import 'package:flutter/material.dart';
import 'package:shrink/api/order_manager.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget bottomNavBar(BuildContext context, List priceArr) {
  return Container(
    height: ScreenSize.height * 0.08,
    width: ScreenSize.width * 1,
    color: globalColor_13DarkBlue,
    child: Center(
      child: Row(
        children: [
          SizedBox(
            width: ScreenSize.width * 0.06,
          ),
          Text(
            "Total",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.23,
          ),
          priceArr[3] == null || priceArr[3] == 0.00
              ? SizedBox(width: ScreenSize.width * 0.13)
              : Text(
                  "${priceArr[3] / 100}" + r"$",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
          SizedBox(
            width: ScreenSize.width * 0.03,
          ),
          GestureDetector(
            onTap: () async {
              await getSessionID(context);
              ((sessionID == '') && (publicKey == ''))
                  ? Center(child: CircularProgressIndicator())
                  : Navigator.pushNamed(context, '/paymentPage');
            },
            child: Container(
              height: ScreenSize.height * 0.05,
              width: ScreenSize.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
