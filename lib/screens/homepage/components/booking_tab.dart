import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink/screens/clinic_page/clinic_page.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:intl/intl.dart';

Widget bookingTab(BuildContext context, int i, DateTime time, String model) {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  DateTime localTime;
  int date;

  int monthNumber;

  String monthName;

  String year;

  if (time != null) {
    localTime = time.toLocal();
    date = localTime.day;
    monthNumber = localTime.month;
    monthName = months[monthNumber - 1];
    year = localTime.year.toString();
  }

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClinicPage(
            companyID: i,
            isBooked: true,
          ),
        ),
      );
    },
    child: Container(
      color: globalColor_12LightGrey,
      height: ScreenSize.height * 0.1,
      child: time == null
          ? SizedBox()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenSize.width * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    date == null
                        ? Text("")
                        : Text(
                            '$date $monthName',
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
                    Row(
                      children: [
                        year == ""
                            ? Text("")
                            : Text(
                                year + " | ",
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
                              ),
                        localTime == null
                            ? Text(
                                " ",
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
                            : Text(
                                new DateFormat.jm().format(
                                  DateTime.parse(localTime.toString()),
                                ),
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
                              ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model,
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
    ),
  );
}
