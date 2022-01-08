import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

import '../../utils/error_handlers.dart';

Future<int> getCompanyMeta(BuildContext context) async {
  int totalItems = 0;

  String companyURL = webTemp + '/api/companies';
  var response =
      await http.get(Uri.parse(companyURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    CompanyInfo companyInfo = CompanyInfo.fromJson(jsonDecode(response.body));
    totalItems = companyInfo.meta.totalItems;
  } else {
    errorDialog(context, 'Unable to get company list');
  }

  return totalItems;
}

// function to fetch clinic screens
Future<int> getCompanyscreens(BuildContext context) async {
  int totalItems = 0;

  String companyURL = webTemp + '/api/companies';
  var response =
      await http.get(Uri.parse(companyURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    CompanyInfo companyInfo = CompanyInfo.fromJson(jsonDecode(response.body));
    debugPrint("set total");
    totalItems = companyInfo.meta.totalscreens;
  } else {
    errorDialog(context, 'Unable to get company list');
  }

  return totalItems;
}

Future<List> getIndexCompanyBasicInfo(
    BuildContext context, int companyID) async {
  List dataArr = [];

  String companyURL = webTemp + '/api/companies/' + companyID.toString();
  var response =
      await http.get(Uri.parse(companyURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    CompanyArr companyArr = CompanyArr.fromJson(jsonDecode(response.body));
    dataArr.add(companyArr.companyID);
    dataArr.add(companyArr.latitude);
    dataArr.add(companyArr.longitude);
  } else {
    errorDialog(context, 'Unable to get index company');
  }

  return dataArr;
}

Future<List> getIndexCompanyDetailedInfo(
    BuildContext context, int companyID) async {
  List dataArr = [];

  String companyURL = webTemp + '/api/companies/' + companyID.toString();
  var response =
      await http.get(Uri.parse(companyURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    CompanyArr companyArr = CompanyArr.fromJson(jsonDecode(response.body));
    dataArr.add(companyArr.companyName);
    dataArr.add(webTemp + companyArr.links.logoFile);
    dataArr.add(companyArr.address);
    dataArr.add(companyArr.building);

    //  print("COMPANY DATA IS $companyArr");
  } else {
    errorDialog(context, 'Unable to get index company details!');
  }

  return dataArr;
}

Future<CompanyArr> getIndexCompanyDetailedInfo2(
    BuildContext context, int companyID) async {
  String companyURL = webTemp + '/api/companies/' + companyID.toString();
  var response =
      await http.get(Uri.parse(companyURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    CompanyArr companyArr = CompanyArr.fromJson(jsonDecode(response.body));
    // print("COMPANY INFO ISSSS === $companyArr");
    return companyArr;
  } else {
    debugPrint("unable $companyID");
  }
  return null;
}

Future<List> getCompanyInfo(BuildContext context) async {
  List dataArr = [];

  String companyURL = webTemp + '/api/companies';
  var response =
      await http.get(Uri.parse(companyURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    CompanyInfo companyInfo = CompanyInfo.fromJson(jsonDecode(response.body));
    dataArr = companyInfo.companyArr;
    // print("Data arr is \n \n $dataArr \n \n ");
  } else {
    errorDialog(context, 'Unable to get Company Info');
  }

  return dataArr;
}
