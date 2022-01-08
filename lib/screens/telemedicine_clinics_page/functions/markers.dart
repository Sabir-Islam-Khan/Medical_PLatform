import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:flutter/cupertino.dart';
import 'package:shrink/screens/clinic_page/clinic_page.dart';

List<Marker> getMarkers(BuildContext context, List companyArr, LatLng point,
    int radius, double _latitude, double _longitude) {
  final Distance distance = new Distance();
  List<Marker> list = [];
  print("radius \n \n \n $radius \n");

  list.add(
    Marker(
      width: 80,
      height: 80,
      point: LatLng(_latitude, _longitude),
      builder: (context) => Container(
        child: Container(
          height: 75.0,
          width: 75.0,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/gifs/user_location.gif"),
          ),
        ),
      ),
    ),
  );
  for (int i = 0; i < companyArr.length; i++) {
    final double km = distance.as(
      LengthUnit.Kilometer,
      new LatLng(companyArr[i][7], companyArr[i][8]),
      new LatLng(point.latitude, point.longitude),
    );
    if (km <= radius) {
      list.add(
        Marker(
          width: 80,
          height: 80,
          point: LatLng(
            companyArr[i][7],
            companyArr[i][8],
          ),
          builder: (context) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClinicPage(
                    companyID: companyArr[i][0],
                    isBooked: false,
                  ),
                ),
              );
            },
            child: Container(
              child: Container(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/logo/clinic_logo.png'),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  return list;
}
