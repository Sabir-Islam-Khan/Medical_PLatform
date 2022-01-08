import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shrink/api/user_data.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

class UserInformation extends ChangeNotifier {
  String fullName = 'Test User';
  String profilePicURL = '';
  double latitude = 0;
  double longitude = 0;
  String designation = "";
  String name = "";
  DetailedUserInfo detailedUserInfo;

  DetailedUserInfo get detailedUserInfoProvider {
    return detailedUserInfo;
  }

  fetchDetailedUserInfo(BuildContext context) async {
    DetailedUserInfo info = await getDetailedUserInfo(context);
    detailedUserInfo = info;
    designation = detailedUserInfo.designation;
    name = detailedUserInfo.username;
    hasCompletedProfile = detailedUserInfo.hasCompletedProfile;
    hasDeliveryAddress = detailedUserInfo.hasDeliveryAddress;
    notifyListeners();
  }

  String get getDesignation {
    return designation;
  }

  String get getName {
    return name;
  }

  String get getFullName {
    return givenName;
  }

  String get getprofilePicURL {
    return profilePicURL;
  }

  double get getLat {
    return latitude;
  }

  double get getLng {
    return longitude;
  }

  updateDisplayInfo(BuildContext context) async {
    await getBasicUserInfo(context);

    profilePicURL = webTemp + profilePicLink;
    notifyListeners();
  }

  updateCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;

    notifyListeners();
  }
}
