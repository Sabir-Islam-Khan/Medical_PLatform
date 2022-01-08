import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget card() {
  return Container(
    margin: EdgeInsets.all(10),
    height: 176,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: globalColor_14DarkGrey,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(1, 1), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.radio_button_checked,
                color: globalColor_1Blue,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Active',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Expanded(
              child: SizedBox(
                width: 5,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Delete",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: globalColor_15LightOrange),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Container(
          color: Colors.white.withOpacity(0.6),
          height: 1,
        ),
        SizedBox(
          height: ScreenSize.height * 0.015,
        ),
        Row(
          children: [
            SizedBox(
              width: ScreenSize.width * 0.05,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LH Chua",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "xxxxxxxxxx4121",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.4,
                    ),
                    Container(
                      height: ScreenSize.height * 0.06,
                      width: ScreenSize.width * 0.1,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset('assets/images/visa.png'),
                      ),
                    ),
                  ],
                ),
                Text(
                  "EXP   09/2028",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ],
    ),
  );
}
