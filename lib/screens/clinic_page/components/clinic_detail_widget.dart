import 'package:flutter/material.dart';
import 'package:shrink/screens/clinic_page/components/booked_tab.dart';
import 'package:shrink/screens/clinic_page/components/clinic_title_tab.dart';
import 'package:shrink/styles/colors.dart';
import 'accepted_methods_section.dart';
import 'consultation_section.dart';
import '../components/precedure_section.dart';
import '../components/times_section.dart';
import '../data/clinic_data_map.dart';

import 'package:shrink/variables/globalVar.dart';
import '../../../api/favourites_manager.dart';
import 'delivery_section.dart';

class ClinicDetailWidget extends StatefulWidget {
  const ClinicDetailWidget({
    Key key,
    @required this.scrollController,
    @required this.companyID,
    @required this.isBooked,
  }) : super(key: key);

  final ScrollController scrollController;
  final int companyID;
  final bool isBooked;

  @override
  State<ClinicDetailWidget> createState() => _ClinicDetailWidgetState();
}

class _ClinicDetailWidgetState extends State<ClinicDetailWidget> {
  favouriteState() {
    if (favouriteClinicIdGlobal.contains(widget.companyID)) {
      setState(() {
        isLiked = true;
      });
    } else {
      setState(() {
        isLiked = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    favouriteState();
  }

  bool isLiked;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> clinicDataMap =
        getClinicData(context, widget.companyID);

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          Container(
            width: ScreenSize.width,
            color: globalColor_14DarkGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.isBooked == true ? bookedTab() : SizedBox(),
                SizedBox(
                  height: ScreenSize.height * 0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ScreenSize.width * 0.02,
                    ),
                    SizedBox(
                      width: 61,
                      height: 61,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/logo/logo_1.png'),
                        image: NetworkImage(
                          clinicDataMap["image"],
                        ),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/logo/logo_1.png');
                        },
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.02,
                    ),
                    clinicTitleTab(clinicDataMap),
                    Expanded(
                      child: SizedBox(),
                    ),
                    isLiked == true
                        ? GestureDetector(
                            onTap: () {
                              unlikeClinic(widget.companyID, context);
                              setState(
                                () {
                                  isLiked = false;
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 10.0,
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: ScreenSize.height * 0.03,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              likeClinic(widget.companyID, context);
                              setState(() {
                                isLiked = true;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 10.0,
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                                size: ScreenSize.height * 0.03,
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                widget.isBooked == true
                    ? SizedBox()
                    : SizedBox(
                        height: 15,
                      ),

                widget.isBooked == true
                    ? SizedBox(
                        height: 10.0,
                      )
                    : SizedBox(),
                consultationSection(),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),
                deliverySection(),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),
                procedureSection(),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),
                // Opening hours
                timesSection(),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),
                acceptedMethodSection(),
                SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
