// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/receipt_provider.dart';
import 'package:shrink/screens/cart/components/dropoff_location.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class ReceiptDetails extends StatelessWidget {
  final int tax;
  final int delivery;
  final int grandTotal;
  final int id;
  ReceiptDetails({
    @required this.tax,
    @required this.delivery,
    @required this.grandTotal,
    @required this.id,
  });
  List supplierNames = [];
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    Provider.of<ReceiptProvider>(context, listen: false)
        .fetchReceiptsDetails(id);
    var data = Provider.of<ReceiptProvider>(context).getReceiptDetailsData;
    for (int i = 0; i < data["items"].length; i++) {
      if (supplierNames.contains(data["items"][i]["supplier_name"]) == false) {
        supplierNames.add(data["items"][i]["supplier_name"]);
      }
    }

    return Scaffold(
      backgroundColor: globalColor_12LightGrey,
      appBar: globalAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.04,
              ),
              child: Text(
                "Receipt",
                style: GoogleFonts.roboto(
                  fontSize: ScreenSize.height * 0.04,
                  fontWeight: FontWeight.bold,
                  color: globalColor_13DarkBlue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.04,
              ),
              child: Text(
                "Reference: " + "965425",
                style: GoogleFonts.roboto(
                  fontSize: ScreenSize.height * 0.022,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
            for (Map<String, dynamic> i in data["items"])
              Container(
                color: Colors.white,
                width: ScreenSize.width * 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenSize.width * 0.06,
                        ),
                        Container(
                          height: ScreenSize.height * 0.12,
                          width: ScreenSize.width * 0.12,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                                "$webTemp${i["_links"]["feature_picture"]}"),
                          ),
                        ),
                        SizedBox(
                          width: ScreenSize.width * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: ScreenSize.width * 0.45,
                              color: Color.fromARGB(255, 152, 157, 199),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  " " + i["supplier_name"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              i["brand"] + " " + i["model"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: ScreenSize.width * 0.35,
                                  child: Text(
                                    r"$" + "${i["amount"] / 100}0",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                Text(
                                  r"X" + "${i["quantity"]}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenSize.width * 0.16,
                                ),
                                Text(
                                  r"$" + "${i["ttl_amount"] / 100}0",
                                  style: TextStyle(
                                    fontSize: ScreenSize.width * 0.043,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06),
              child: Text(
                "PickUp",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (String i in supplierNames)
              Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: ScreenSize.width * 0.06,
                ),
                child: Row(
                  children: [
                    Container(
                      width: ScreenSize.width * 0.6,
                      child: Text(
                        i,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenSize.width * 0.06,
                      ),
                      child: Text(
                        r"$" + "${delivery / 100 / supplierNames.length}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[600],
                        ),
                      ),
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
              child: Column(
                children: [
                  for (Map<String, dynamic> i in userAddressGlobal["items"])
                    i["is_active"] == true ? LocationCard(i) : SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06),
              child: Text(
                "Tax",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06, top: 5.0),
              child: Row(
                children: [
                  Text(
                    "Singapore - 7% GST",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  tax == null
                      ? Text(
                          r"$" + "0.00",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[600],
                          ),
                        )
                      : Text(
                          r"$" + "${tax / 100}0",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[600],
                          ),
                        ),
                  SizedBox(
                    width: ScreenSize.width * 0.06,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06),
              child: Text(
                "Total",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06, top: 5.0),
              child: Row(
                children: [
                  Text(
                    "You paid",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    r"$" + "${grandTotal / 100}0",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[600],
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
            Center(
              child: Icon(
                Icons.mail_outline_outlined,
                size: 60.0,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
