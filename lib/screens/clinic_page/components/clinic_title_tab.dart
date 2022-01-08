import 'package:flutter/material.dart';
import 'package:shrink/variables/globalVar.dart';

Widget clinicTitleTab(Map<String, dynamic> clinicDataMap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 250,
        child: Text(
          clinicDataMap["name"],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      Text(
        clinicDataMap["building"],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      Text(
        clinicDataMap["address"],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      Text(
        clinicDataMap["country"] + " " + clinicDataMap["postalcode"],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Text(
            clinicDataMap["phone"],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.35,
          ),
        ],
      ),
    ],
  );
}
