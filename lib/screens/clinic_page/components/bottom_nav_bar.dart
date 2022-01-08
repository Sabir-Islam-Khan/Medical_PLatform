import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/booking_provider.dart';
import 'package:shrink/screens/clinic_check_list/clinic_check_list.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget bottomNavBar(
  BuildContext context,
  int companyID,
  String image,
  String name,
  bool isBooked,
) {
  return Container(
    height: ScreenSize.height * 0.09,
    width: ScreenSize.width * 1,
    color: globalColor_13DarkBlue,
    child: Center(
      child: Row(
        children: [
          SizedBox(
            width: ScreenSize.width * 0.57,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClinicCheckList(
                    companyId: companyID,
                    picUrl: image,
                    name: name,
                  ),
                ),
              );
            },
            child: bookedClinicIDList.contains(companyID)
                ? GestureDetector(
                    onTap: () {
                      Provider.of<BookingProvider>(context, listen: false)
                          .toogleLoading();
                      Provider.of<BookingProvider>(context, listen: false)
                          .deleteClinicBooking(context);
                    },
                    child: Container(
                      height: ScreenSize.height * 0.05,
                      width: ScreenSize.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red[900],
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: ScreenSize.height * 0.05,
                    width: ScreenSize.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "BOOK NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
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
