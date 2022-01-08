import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';

import 'package:shrink/screens/favourites/components/favourite_clinics_card.dart';
import 'package:shrink/variables/globalVar.dart';

class FavouriteClinicGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List> _companyArr = Provider.of<CompanyObj>(context).getCompanyArray;
    List<List> filteredList = [];
    for (int i = 0; i < _companyArr.length; i++) {
      if (favouriteClinicIdGlobal.contains(_companyArr[i][0])) {
        filteredList.add(_companyArr[i]);
      }
    }
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: filteredList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.1,
        // crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int widgetIndex) {
        // final promoIndex = widgetIndex - 1;

        return Padding(
          padding: EdgeInsets.only(
            left: ScreenSize.width * 0.02,
            right: ScreenSize.width * 0.02,
          ),
          child: FavouriteClinicCard(
            id: filteredList[widgetIndex][0],
            name: filteredList[widgetIndex][1],
            picURL: filteredList[widgetIndex][2],
            distance: filteredList[widgetIndex][3],
            building: filteredList[widgetIndex][4],
            address: filteredList[widgetIndex][5],
            isLiked: true,
          ),
        );
      },
    );
  }
}
