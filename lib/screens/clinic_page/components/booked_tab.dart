import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget bookedTab() {
  return Container(
    color: globalColor_12LightGrey,
    height: ScreenSize.height * 0.1,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: ScreenSize.width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '18 Apr',
              style: GoogleFonts.roboto(
                fontSize: ScreenSize.height * 0.033,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                  255,
                  17,
                  34,
                  65,
                ),
              ),
            ),
            Text(
              '2021 | 8:30 AM',
              style: GoogleFonts.roboto(
                fontSize: ScreenSize.height * 0.019,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                  255,
                  17,
                  34,
                  65,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Teleconsult',
              style: GoogleFonts.roboto(
                fontSize: ScreenSize.height * 0.03,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(
                  255,
                  17,
                  34,
                  65,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                '     Appointment',
                style: GoogleFonts.roboto(
                  fontSize: ScreenSize.height * 0.022,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(
                    255,
                    17,
                    34,
                    65,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: ScreenSize.width * 0.05,
        ),
      ],
    ),
  );
}
