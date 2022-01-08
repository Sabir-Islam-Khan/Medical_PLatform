// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/favourites_manager.dart';

import 'package:shrink/provider/user_provider.dart';
import 'package:shrink/screens/clinic_page/clinic_page.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';

class ClinicCard extends StatefulWidget {
  final int id;
  final String name;
  final String picURL;
  final String distance;
  final String building;
  final String address;
  bool isLiked;

  ClinicCard({
    @required this.id,
    @required this.name,
    @required this.picURL,
    @required this.distance,
    @required this.building,
    @required this.address,
    @required this.isLiked,
  });
  @override
  _ClinicCardState createState() => _ClinicCardState();
}

class _ClinicCardState extends State<ClinicCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
          ),
          margin: EdgeInsets.all(1.0),
          width: ScreenSize.width * 0.49,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Provider.of<UserInformation>(context, listen: false)
                  .updateCurrentLocation();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClinicPage(
                    companyID: widget.id,
                    isBooked: false,
                  ),
                ),
              );
            },
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: ScreenSize.width * 0.16,
                    height: ScreenSize.height * 0.13,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: widget.picURL == ""
                          ? Text("DEBUG .. No PIC")
                          : Image.network(
                              widget.picURL,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenSize.height * 0.01,
                ),
                Text(
                  widget.name,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Book Now",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: globalColor_10Orange,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: ScreenSize.width * 0.3,
                  //  color: Colors.greenAccent.withOpacity(0.5),
                  child: widget.address == null
                      ? Text(
                          "No data",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        )
                      : Text(
                          widget.address,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: clinicButton(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: widget.isLiked == false
              ? GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        widget.isLiked = !widget.isLiked;
                      },
                    );
                    print("Like");
                    likeClinic(widget.id, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 5.0),
                    child: Icon(
                      Icons.star,
                      color: Colors.grey,
                      size: ScreenSize.height * 0.025,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        widget.isLiked = !widget.isLiked;
                      },
                    );
                    print("Unlike");
                    unlikeClinic(widget.id, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 5.0),
                    child: Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: ScreenSize.height * 0.025,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

Widget clinicButton() {
  return Padding(
    padding: EdgeInsets.only(
      left: 2.0,
    ),
    child: IconButton(
      onPressed: () {
        print("Clinic Button Pressed");
      },
      icon: Stack(
        children: [
          Icon(
            Icons.circle,
            color: Color.fromARGB(255, 70, 96, 124),
            size: 32,
          ),
          Center(
            child: Icon(
              Icons.circle,
              color: Colors.black.withAlpha(100),
              size: 25,
            ),
          ),
          Center(
            child: Text("Clinic",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                )),
          )
        ],
      ),
    ),
  );
}
