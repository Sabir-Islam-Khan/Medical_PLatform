// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';

class InsuranceElement extends StatefulWidget {
  Map<String, dynamic> data;
  InsuranceElement({Key key, this.data}) : super(key: key);

  @override
  _InsuranceElementState createState() => _InsuranceElementState();
}

class _InsuranceElementState extends State<InsuranceElement> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    setState(() {
                      widget.data["default"] = !widget.data["default"];
                    });
                  },
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    widget.data["default"]
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: globalColor_1Blue,
                  )),
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
                      color: globalColor_15LightOrange,
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    widget.data["insurancecompany"],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${widget.data["insurancetype"]} " +
                        "| " +
                        widget.data["policynumber"],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Text(
                    "Exp " + widget.data["expirydate"],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
