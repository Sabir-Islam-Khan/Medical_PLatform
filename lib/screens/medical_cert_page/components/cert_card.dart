// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';

import 'package:shrink/screens/medical_cert_page/components/cert_details.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:intl/intl.dart';

class CertCard extends StatelessWidget {
  // const PurchaseCard({ Key? key }) : super(key: key);
  var data;
  CertCard({@required this.data});

  @override
  Widget build(BuildContext context) {
    double _companyLat = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][7];
    double _companyLng = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][8];
    String companyName = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][1];
    String companyAddress = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][5];
    String companyBuilding = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][4];
    String companyPostalCode = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][6];
    String companyPhone = "+65 68832883";
    String companyLogoUrl = Provider.of<CompanyObj>(context)
        .getCompanyArray[data["provider_id"]][2];
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

    void pushToDetails() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CertDetails(
            companyLat: _companyLat,
            companyLon: _companyLng,
            date: date.toString(),
            monthName: monthName,
            year: year,
            timestamp: localTime,
            clinicAddress: companyAddress,
            clinicBuilding: companyBuilding,
            clinicLogoUrl: companyLogoUrl,
            clinicName: companyName,
            clinicPhone: companyPhone,
            clinicPostalCode: companyPostalCode,
            description: data["description"],
            days: data["num_of_unfit_days"].toString(),
            fromDate: data["start_time"],
            toDate: data["end_time"],
            doctorName: data["provider_full_name"],
            userId: data["customer_national_id"],
            userName: data["customer_full_name"],
          ),
        ),
      );
    }

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
                    "Teleconsult",
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
                  "Medical Cert",
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
