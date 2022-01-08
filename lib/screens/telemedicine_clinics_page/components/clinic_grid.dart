import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/screens/telemedicine_clinics_page/components/clinic_card.dart';
import 'package:shrink/variables/globalVar.dart';

class ClinicGrid extends StatelessWidget {
  // const ClinicGrid({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> _companyArr = Provider.of<CompanyObj>(context).getCompanyArray;
    int itemCount = _companyArr.length ~/ 2;
    return Padding(
      padding: EdgeInsets.only(
        left: 3.0,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.15,
        ),
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int widgetIndex) {
          return ClinicCard(
            id: _companyArr[widgetIndex][0],
            name: _companyArr[widgetIndex][1],
            picURL: _companyArr[widgetIndex][2],
            distance: _companyArr[widgetIndex][3],
            building: _companyArr[widgetIndex][4],
            address: _companyArr[widgetIndex][5],
            isLiked: favouriteClinicIdGlobal.contains(
              _companyArr[widgetIndex][0],
            )
                ? true
                : false,
          );
        },
      ),
    );
  }
}
