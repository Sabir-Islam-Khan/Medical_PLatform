// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink/screens/receipt/components/receipt_details.dart';

import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:intl/intl.dart';

class PurchaseCard extends StatelessWidget {
  // const PurchaseCard({ Key? key }) : super(key: key);
  var data;
  PurchaseCard({@required this.data});
  @override
  Widget build(BuildContext context) {
    void pushToDetails() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReceiptDetails(
            tax: data["tax_subtotal"],
            delivery: data["delivery_subtotal"],
            grandTotal: data["grand_total"],
            id: data["id"],
          ),
        ),
      );
    }

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
    DateTime timestamp = DateTime.parse(data["created_on"]);
    DateTime localTime = timestamp.toLocal();
    int date = localTime.day;
    int monthNumber = localTime.month;
    String monthName = months[monthNumber - 1];
    String year = localTime.year.toString();

    return Card(
      elevation: 2.0,
      child: Container(
        height: ScreenSize.height * 0.2,
        width: ScreenSize.width * 0.95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date.toString() + " $monthName",
                        style: GoogleFonts.roboto(
                          fontSize: ScreenSize.height * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            year + " | ",
                            style: GoogleFonts.roboto(
                              fontSize: ScreenSize.height * 0.025,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            new DateFormat.jm().format(
                              DateTime.parse(localTime.toString()),
                            ),
                            style: GoogleFonts.roboto(
                              fontSize: ScreenSize.height * 0.025,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    "Marketplace",
                    style: TextStyle(
                      fontSize: ScreenSize.height * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.width * 0.06,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.06,
              ),
              child: InkWell(
                onTap: () {
                  pushToDetails();
                },
                splashColor: globalColor_10Orange,
                child: Text(
                  "Receipt",
                  style: TextStyle(
                    color: globalColor_10Orange,
                    fontSize: ScreenSize.height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
