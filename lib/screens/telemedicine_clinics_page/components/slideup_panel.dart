import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'clinic_grid.dart';

class SlideupPanel extends StatelessWidget {
  SlideupPanel({
    Key key,
    @required this.scrollController,
    @required this.isBooked,
    // ignore: invalid_annotation_target
    @optionalTypeArgs this.bookedCompanyId,
  }) : super(key: key);
  final bool isBooked;
  final int bookedCompanyId;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: globalColor_16Blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Container(
                            width: 55.0,
                            height: 1.0,
                            color: Color.fromRGBO(151, 151, 151, 1)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Container(
                          width: 55.0,
                          height: 1.0,
                          color: Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Telemedicine Clinics",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: ScreenSize.height * 200,
                        child: Container(
                          child: ClinicGrid(),
                        ),
                      ),
                      SizedBox(
                        height: 150.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
