import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shrink/screens/homepage/homepage.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getUserAddress() async {
  var addressUrl = Uri.parse(webTemp + "/api/users/$userID/user_addresses");
  var response = await http.get(
    addressUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  var dataArr = jsonDecode(response.body);

  // print("Address URL  response \n \n ${response.body} \n \n");
  return dataArr;
}

Future<void> createAddress(
  String building,
  String street,
  String unitNum,
  String city,
  String state,
  String country,
  String zipCode,
  String blockNumber,
  String floorNumber,
  BuildContext context,
) async {
  print("\n create address called \n");
  var createAddressUrl = Uri.parse(webTemp + "/api/addresses");

  var jsonData = jsonEncode(
    {
      "building": building,
      "block": blockNumber,
      "street": street,
      "floor_num": floorNumber,
      "unit_num": unitNum,
      "city": city,
      "state": state,
      "country": country,
      "postal_code": zipCode,
      "is_active": true
    },
  );

  var response = await http.post(
    createAddressUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
    body: jsonData,
  );
  if (response.statusCode == 200) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
    print("Posting Address Success");
  } else {
    print("Error in posting address \n \n status \n ${response.statusCode} \n");
  }
}

//method for deleting address

Future<void> deleteAddress(int id, BuildContext context) async {
  print("id is $id");

  var deleteAddressUrl =
      Uri.parse(webTemp + "/api/addresses/$id/delete_address");

  var response = await http.delete(
    deleteAddressUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("Deleting address successfull");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  } else {
    print("Couldn't delete .. \n \n ${response.statusCode}");
  }
}
