import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

Future<List> getPromoArr(BuildContext context) async {
  List dataArr = [];

  String promoURl = webTemp + '/api/promos';
  var response = await http.get(Uri.parse(promoURl), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    ProductInfo promoInfo = ProductInfo.fromJson(jsonDecode(response.body));
    dataArr = promoInfo.itemArr;
  } else {
    //  errorDialog(context, 'No Promo Info');
  }
  return dataArr;
}

// this is a comment
Future<List> getPromoIdList() async {
  List idArray = [];

  String promoURl = webTemp + '/api/promos';
  var response = await http.get(Uri.parse(promoURl), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (int i = 0; i < decodedData["_meta"]["total_items"]; i++) {
      idArray.add(decodedData["items"][i]["id"]);
    }
    return idArray;
  } else {
    //  errorDialog(context, 'No Promo Info');
  }
  return idArray;
}

// function to fetch current promotions
Future<List> getPromotions(BuildContext context) async {
  List dataArr = [];
  String promoURL = webTemp + '/api/promos';
  var response = await http.get(Uri.parse(promoURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    ProductInfo productInfo = ProductInfo.fromJson(jsonDecode(response.body));
    dataArr = productInfo.itemArr;
  } else {
    // errorDialog(context, 'No Promotion Info');
  }
  return dataArr;
}
