import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:shrink/styles/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:latlong2/latlong.dart';
import 'package:shrink/variables/routes.dart';
import 'package:intl/intl.dart';

class CertDetails extends StatelessWidget {
  // const CertDetails({ Key? key }) : super(key: key);
  final double companyLat;
  final double companyLon;
  final String date;
  final String monthName;
  final String year;
  final DateTime timestamp;
  final String clinicName;
  final String clinicBuilding;
  final String clinicAddress;
  final String clinicPostalCode;
  final String clinicPhone;
  final String clinicLogoUrl;
  final String description;
  final String days;
  final String fromDate;
  final String toDate;
  final String doctorName;
  final String userName;
  final String userId;

  CertDetails({
    @required this.companyLat,
    @required this.companyLon,
    @required this.date,
    @required this.monthName,
    @required this.year,
    @required this.timestamp,
    @required this.clinicName,
    @required this.clinicBuilding,
    @required this.clinicAddress,
    @required this.clinicPhone,
    @required this.clinicPostalCode,
    @required this.clinicLogoUrl,
    @required this.description,
    @required this.days,
    @required this.fromDate,
    @required this.toDate,
    @required this.doctorName,
    @required this.userId,
    @required this.userName,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: globalAppBar(context),
      body: Stack(
        children: [
          SlidingUpPanel(
            renderPanelSheet: true,
            parallaxEnabled: true,
            minHeight: ScreenSize.height * 0.55,
            maxHeight: ScreenSize.height * 0.88,
            parallaxOffset: 0.6,
            panelBuilder: (homeScrollController) => buildSlidePanel(
              homeScrollController: homeScrollController,
              date: this.date,
              monthName: this.monthName,
              year: this.year,
              timestamp: this.timestamp,
              clinicAddress: this.clinicAddress,
              clinicBuilding: this.clinicBuilding,
              clinicLogoUrl: this.clinicLogoUrl,
              clinicName: this.clinicName,
              clinicPhone: this.clinicPhone,
              clinicPostalCode: this.clinicPostalCode,
              description: this.description,
              days: this.days,
              fromDate: this.fromDate,
              toDate: this.toDate,
              doctorName: this.doctorName,
              userId: this.userId,
              userName: this.userName,
            ),
            body: Stack(
              children: [
                Container(
                  width: ScreenSize.width * 1,
                  height: ScreenSize.height * 0.45,
                  child: FlutterMap(
                    options: MapOptions(
                      zoom: 15,
                      minZoom: 10.0,
                      center: LatLng(this.companyLat, this.companyLon),
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: mapboxURL,
                        additionalOptions: {
                          'accessToken': mapBoxToken,
                          'id': mapBoxID
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 85,
                            height: 85,
                            point: LatLng(this.companyLat, this.companyLon),
                            builder: (context) => Container(
                              child: Container(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                      'assets/logo/clinic_logo.png'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSlidePanel({
  @required ScrollController homeScrollController,
  @required final String date,
  @required final String monthName,
  @required final String year,
  @required final DateTime timestamp,
  @required final String clinicName,
  @required final String clinicAddress,
  @required final String clinicBuilding,
  @required final String clinicPostalCode,
  @required final String clinicPhone,
  @required final String clinicLogoUrl,
  @required final String description,
  @required final String days,
  @required final String fromDate,
  @required final String toDate,
  @required final String doctorName,
  @required final String userName,
  @required final String userId,
}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: ScreenSize.width * 0.035,
            right: 5.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenSize.height * 0.02,
                      left: ScreenSize.width * 0.035,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              date + " $monthName",
                              style: GoogleFonts.roboto(
                                fontSize: ScreenSize.height * 0.042,
                                fontWeight: FontWeight.bold,
                                color: globalColor_13DarkBlue,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  year + " | ",
                                  style: GoogleFonts.roboto(
                                    fontSize: ScreenSize.height * 0.025,
                                    fontWeight: FontWeight.w400,
                                    color: globalColor_13DarkBlue,
                                  ),
                                ),
                                Text(
                                  new DateFormat.jm().format(
                                    DateTime.parse(timestamp.toString()),
                                  ),
                                  style: GoogleFonts.roboto(
                                    fontSize: ScreenSize.height * 0.025,
                                    fontWeight: FontWeight.w400,
                                    color: globalColor_13DarkBlue,
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
                          "Teleconsult",
                          style: TextStyle(
                            fontSize: ScreenSize.height * 0.035,
                            fontWeight: FontWeight.w400,
                            color: globalColor_13DarkBlue,
                          ),
                        ),
                        SizedBox(
                          width: ScreenSize.width * 0.06,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Divider(
                    color: globalColor_14DarkGrey,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenSize.width * 0.035,
                      right: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Medical Certificate",
                          style: GoogleFonts.roboto(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 155, 159, 199),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Issued by : Dr. $doctorName",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "This is to certicy that $userName, $userId is $description for a period of $days day(s) from ${fromDate.substring(0, 16)} to ${toDate.substring(0, 16)} inclusive after which he/she will be fit for ordinary duty. \n\n This certificate is not valid for absence from court or other judicial proceddings. ",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
        )
      ],
    ),
  );
}
