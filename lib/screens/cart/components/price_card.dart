// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/order_manager.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

class DisplayTotals extends StatelessWidget {
  List dataArr = [
    0.00,
    0.00,
    0.00,
    0.00,
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<DeliveryFees>(context, listen: false).getFeesData();
    dataArr = Provider.of<DeliveryFees>(context).data;

    return Column(
      children: [
        Container(
          color: Colors.white,
          width: ScreenSize.width - 30,
          height: 40,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                "Subtotal",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Expanded(
                child: SizedBox(
                  width: 10,
                ),
              ),
              Text(
                r"$" + (dataArr[0] / 100).toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          width: ScreenSize.width - 30,
          height: 40,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                "Delivery",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              dataArr[1] == null
                  ? Text(
                      r"$" + "0.00",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    )
                  : Text(
                      r"$" + (dataArr[1] / 100).toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          width: ScreenSize.width - 30,
          height: 40,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                "Tax",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Expanded(
                child: SizedBox(
                  width: 10,
                ),
              ),
              dataArr[2] == null
                  ? Text(
                      r"$" + "0.00",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    )
                  : Text(
                      r"$" + (dataArr[2] / 100).toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          width: ScreenSize.width - 30,
          height: 40,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 10,
                ),
              ),
              dataArr[3] == null
                  ? Text(
                      r"$" + "0.00",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  : Text(
                      r"$" + (dataArr[3] / 100).toString(),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: ScreenSize.height * 0.07,
          width: 300,
          child: ElevatedButton(
            onPressed: () async {
              await getSessionID(context);
              ((sessionID == '') && (publicKey == ''))
                  ? Center(child: CircularProgressIndicator())
                  : Navigator.pushNamed(context, '/paymentPage');
            },
            child: Text(
              'Checkout',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                return globalColor_2Blue;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
