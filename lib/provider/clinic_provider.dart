import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/clinic_data.dart';
import 'package:shrink/api/favourites_manager.dart';
import 'package:shrink/variables/globalVar.dart';

import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

import 'user_provider.dart';

class CompaniesInformation extends ChangeNotifier {
  List coorArr = [];

  List get getCoorArray {
    return coorArr;
  }
}

class CompanyObj extends ChangeNotifier {
  List<List> _companyArr = [];
  List<bool> _truthTable = [];

  List<List> get getCompanyArray {
    return _companyArr;
  }

  List<bool> get getTruthTable {
    return _truthTable;
  }

  updateArray(BuildContext context) async {
    List tempArr = [];
    CompanyArr companyArr;
    double distanceInMeters;
    double _latitude =
        Provider.of<UserInformation>(context, listen: false).getLat;
    double _longitude =
        Provider.of<UserInformation>(context, listen: false).getLng;
    _companyArr.clear();
    _truthTable.clear();
    tempArr = await getCompanyInfo(context);
    for (int i = 0; i < tempArr.length; i++) {
      _truthTable.add(true);
      companyArr = tempArr[i];
      distanceInMeters = Geolocator.distanceBetween(_latitude ?? 0,
          _longitude ?? 0, companyArr.latitude, companyArr.longitude);
      _companyArr.add([
        companyArr.companyID,
        companyArr.companyName,
        webTemp + companyArr.links.logoFile,
        (distanceInMeters / 1000).toStringAsFixed(2),
        companyArr.building,
        companyArr.address,
        companyArr.zipCode,
        companyArr.latitude,
        companyArr.longitude,
        companyArr.zipCode,
        companyArr.businessRadius,
        companyArr.country,
      ]);

      _truthTable[i] = false;
    }
    notifyListeners();
  }
}

class FavouriteClinicProvider extends ChangeNotifier {
  List likedClinics;

  fetchLikedCLinics() async {
    likedClinics = await getFavouriteClinicsIdList();
    favouriteClinicIdGlobal = likedClinics;
    notifyListeners();
  }
}
