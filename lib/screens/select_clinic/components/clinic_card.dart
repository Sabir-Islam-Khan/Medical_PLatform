// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

class SelectClinicElement extends StatefulWidget {
  Map<String, dynamic> data;
  Function(bool favourit) favouritChange;
  SelectClinicElement({Key key, this.data, this.favouritChange})
      : super(key: key);

  @override
  _SelectClinicElementState createState() => _SelectClinicElementState();
}

class _SelectClinicElementState extends State<SelectClinicElement> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height * 0.21,
      margin: EdgeInsets.all(10),
      // height: ScreenSize.height * 0.17,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              return Colors.white;
            },
          ),
          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed("/productPage");
        },
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: ScreenSize.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenSize.width * 0.015,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        widget.data["image"],
                        width: 61,
                        height: 61,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            width: ScreenSize.width * 0.65,
                            // color: Colors.red,
                            child: Text(
                              widget.data["title"],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.height * 0.01,
                          ),
                          Text(
                            "Accepts: " + widget.data["accepts"],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: ScreenSize.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                widget.data["distance"].toStringAsFixed(1) +
                                    " km",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenSize.height * 0.025,
                          ),
                        ],
                      ),
                      // Expanded(
                      //   child: SizedBox(),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: ScreenSize.width * 0.03,
              // top: ScreenSize.height * 0.001,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.data["favourit"] = !widget.data["favourit"];
                  });
                  widget.favouritChange(widget.data["favourit"]);
                },
                icon: Icon(
                  widget.data["favourit"] ? Icons.star : Icons.star_border,
                  color: globalColor_1Blue,
                  size: ScreenSize.height * 0.032,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
