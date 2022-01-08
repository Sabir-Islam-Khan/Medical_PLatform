import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';

import 'package:shrink/screens/favourites/components/favourite_clinics_card.dart';
import 'package:shrink/variables/globalVar.dart';

class FavouriteClinicScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List> _companyArr = Provider.of<CompanyObj>(context).getCompanyArray;

    List<bool> _companyTruthTable =
        Provider.of<CompanyObj>(context).getTruthTable;
    return Padding(
      padding: EdgeInsets.only(
        left: 3.0,
      ),
      child: ListView.builder(
        //shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: (_companyArr.length * 2),
        itemBuilder: (BuildContext context, int widgetIndex) {
          if (widgetIndex.isOdd)
            return Divider(
              color: Colors.transparent,
            );

          final itemIndex = widgetIndex ~/ 2;

          return _companyTruthTable[itemIndex]
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FavouriteClinicCard(
                  id: _companyArr[itemIndex][0],
                  name: _companyArr[itemIndex][1],
                  picURL: _companyArr[itemIndex][2],
                  distance: _companyArr[itemIndex][3],
                  building: _companyArr[itemIndex][4],
                  address: _companyArr[itemIndex][5],
                  isLiked: favouriteClinicIdGlobal.contains(
                    _companyArr[itemIndex][0],
                  )
                      ? true
                      : false,
                );
        },
      ),
    );
  }
}
