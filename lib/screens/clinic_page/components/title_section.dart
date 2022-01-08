import 'package:flutter/material.dart';
import 'package:shrink/screens/clinic_page/data/clinic_data_map.dart';

import 'package:shrink/variables/globalVar.dart';

Widget titleSection(BuildContext context, int companyID) {
  Map<String, dynamic> clinicDataMap = getClinicData(context, companyID);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: ScreenSize.width * 0.02,
      ),
      SizedBox(
        width: 61,
        height: 61,
        child: FadeInImage(
          placeholder: AssetImage('assets/images/logo_1.png'),
          image: NetworkImage(
            clinicDataMap["image"],
          ),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/logo_1.png');
          },
        ),
      ),
      SizedBox(
        width: ScreenSize.width * 0.02,
      ),
      Column(
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
      ),
      Expanded(
        child: SizedBox(),
      ),
      favouriteClinicIdGlobal.contains(companyID)
          ? Icon(Icons.favorite_border)
          : Icon(Icons.favorite_border),
    ],
  );
}
