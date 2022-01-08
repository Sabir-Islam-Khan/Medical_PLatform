import 'package:flutter/material.dart';
import 'package:shrink/api/address_manager.dart';
import 'package:shrink/styles/colors.dart';

class DeliveryAddressElement extends StatefulWidget {
  final Map<String, dynamic> data;
  DeliveryAddressElement({Key key, this.data}) : super(key: key);

  @override
  _DeliveryAddressElementState createState() => _DeliveryAddressElementState();
}

class _DeliveryAddressElementState extends State<DeliveryAddressElement> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return isLoading == true
        ? SizedBox()
        : Container(
            margin: EdgeInsets.all(10),
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
                            widget.data["is_active"] =
                                !widget.data["is_active"];
                          });
                        },
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          widget.data["is_active"]
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
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          deleteAddress(
                            widget.data["id"],
                            context,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        },
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
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      widget.data["building"] == ""
                          ? SizedBox()
                          : Text(
                              widget.data["building"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Block " + widget.data["block"],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        widget.data["street"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      widget.data["floor"] == ""
                          ? SizedBox()
                          : SizedBox(
                              height: 2.0,
                            ),
                      widget.data["floor"] == ""
                          ? SizedBox()
                          : Text(
                              "Floor " + widget.data["floor"],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                      widget.data["unit"] == ""
                          ? SizedBox()
                          : SizedBox(
                              height: 2.0,
                            ),
                      widget.data["unit"] == ""
                          ? SizedBox()
                          : Text(
                              "Unit " + widget.data["unit"],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        widget.data["city"] + " , " + widget.data["state"],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        widget.data["country"],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        widget.data["postal_code"],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
