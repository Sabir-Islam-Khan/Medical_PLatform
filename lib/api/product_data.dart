import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';
import 'package:http/http.dart' as http;

Future<List> getProductArr(BuildContext context) async {
  List dataArr = [];
  var response =
      await http.get(Uri.parse(productsTemp), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    ProductInfo productInfo = ProductInfo.fromJson(jsonDecode(response.body));
    dataArr = productInfo.itemArr;
  } else {
    // errorDialog(context, 'No Product Info');
  }
  return dataArr;
}

// get product info with index

Future<List> getIndexProductInfo(BuildContext context, int index) async {
  List dataArr = [0, ' ', ' ', 0];

  var indexProductURL = Uri.parse(productsTemp + "/" + index.toString());
  var response = await http.get(indexProductURL, headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    ProductArr indexInfo = ProductArr.fromJson(jsonDecode(response.body));
    dataArr[0] = indexInfo.productID;
    dataArr[1] = indexInfo.brand;
    dataArr[2] = webTemp + indexInfo.links.featurePic;
    dataArr[3] = indexInfo.amount;
  } else {}

  return dataArr;
}

// function to fetch product description

Future<String> getProductDescription(BuildContext context, int index) async {
  String string = '';

  var indexProductURL = Uri.parse(productsTemp + "/" + index.toString());
  var response = await http.get(indexProductURL, headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    ProductArr indexInfo = ProductArr.fromJson(jsonDecode(response.body));
    string = indexInfo.description;
  } else {}

  return string ?? '';
}
