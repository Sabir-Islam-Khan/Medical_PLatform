import 'package:flutter/material.dart';
import 'package:shrink/screens/homepage/components/booking_tab.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

Widget bookedClinicData(BuildContext context, Map<String, dynamic> data) {
//  int id = int.parse(data["company_id"]);
  String picUrl = imageTemp + data["company_logo_file"];
  int id = 1;
  return Container(
    color: globalColor_14DarkGrey,
    child: Column(
      children: [
        bookingTab(context, id, DateTime.parse(data["timestamp"]),
            data["product_model"]),
        SizedBox(
          height: 10.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: ScreenSize.width * 0.02,
            ),
            SizedBox(
              width: 61,
              height: 61,
              child: FadeInImage(
                placeholder: AssetImage('assets/logo/logo_1.png'),
                image: NetworkImage(
                  picUrl,
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/logo/logo_1.png');
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
                    data["company_name"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  data["company_building"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Text(
                  data["company_street"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Text(
                  data["company_city"] + " " + data["company_postal_code"],
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
                      "658416451",
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
            favouriteClinicIdGlobal.contains(data["company_id"])
                ? Icon(
                    Icons.star,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.star,
                    color: globalColor_12LightGrey,
                  ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    ),
  );
}
