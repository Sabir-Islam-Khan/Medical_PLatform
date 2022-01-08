import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shrink/screens/homepage/homepage.dart';

import 'package:shrink/utils/error_handlers.dart';
import 'package:shrink/variables/globalVar.dart';

import 'package:shrink/variables/routes.dart';

updateProfile(
  BuildContext context,
  TextEditingController allergyController,
  TextEditingController conditionsController,
  TextEditingController countrycodeController,
  String designationValue,
  TextEditingController givennameController,
  TextEditingController idnumberController,
  String idtypeValue,
  TextEditingController lastnameController,
  TextEditingController mobilenumberController,
  TextEditingController emailController,
  TextEditingController nationalityController,
  TextEditingController languageController,
  TextEditingController usernameController,
  String currency,
) async {
  Map data = <String, String>{
    "username": usernameController.value.text,
    "allergies": allergyController.value.text,
    "pre_existing": conditionsController.value.text,
    "about_me": "N/A",
    "country_code": countrycodeController.value.text,
    "designation": designationValue,
    "given_name": givennameController.value.text,
    "id_reg": idnumberController.value.text,
    "id_type": idtypeValue,
    "last_name": lastnameController.value.text, //never updates
    "phone": mobilenumberController.value.text,
    "email": emailController.value.text,
    "nationality": nationalityController.value.text,
    "languages": languageController.value.text,
    "currency_name": currency,
  };

  String jsonData = jsonEncode(data);
  var updateURL = Uri.parse(userInfoTemp + userID.toString());
  var response = await http.put(
    updateURL,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    },
    body: jsonData,
  );
  print(jsonData);
  if (response.statusCode == 200) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  } else {
    print("status code is ${response.statusCode}");
    errorDialog(context, 'Could not update profile info');
  }
}

// fields checking function

bool checkEmpty(
  BuildContext context,
  TextEditingController allergyController,
  TextEditingController conditionsController,
  TextEditingController countrycodeController,
  String designationValue,
  TextEditingController givennameController,
  TextEditingController idnumberController,
  String idtypeValue,
  TextEditingController lastnameController,
  String nationalityValue,
  TextEditingController mobilenumberController,
  String currencyValue,
) {
  bool _isEmpty = false;
  int i = 0;
  List errorArr = [];

  if (designationValue == "Select Designation") {
    i++;
    errorArr.add('designation');
  }
  if ((lastnameController.text).trim().isEmpty) {
    i++;
    errorArr.add('last name');
  }
  if ((givennameController.text).trim().isEmpty) {
    i++;
    errorArr.add('given name');
  }
  if (((countrycodeController.text).trim().isEmpty) ||
      (num.tryParse(countrycodeController.text) == null)) {
    i++;
    errorArr.add('country code');
  }
  if (((mobilenumberController.text).trim().isEmpty) ||
      (num.tryParse(mobilenumberController.text) == null)) {
    i++;
    errorArr.add('mobile number');
  }
  if (idtypeValue == "Select ID Type") {
    i++;
    errorArr.add('ID type');
  }
  if (currencyValue == "Select Preferred Currency") {
    i++;
    errorArr.add("Currency");
  }
  if ((idnumberController.text).trim().isEmpty) {
    i++;
    errorArr.add('ID number');
  }

  if ((allergyController.text).trim().isEmpty) {
    i++;
    errorArr.add('allergy');
  }
  if ((conditionsController.text).trim().isEmpty) {
    i++;
    errorArr.add('pre-exisitng conditions');
  }

  if (i != 0) {
    _isEmpty = true;
    popUpDialog(context, 'Invalid Fields',
        ('These fields are invalid; ' + errorArr.join(', ')));
  }

  return _isEmpty;
}

// check init value

void initLogics(
  BuildContext context,
  TextEditingController allergyController,
  TextEditingController conditionsController,
  TextEditingController countrycodeController,
  String designationValue,
  TextEditingController givennameController,
  TextEditingController idnumberController,
  String idtypeValue,
  TextEditingController lastnameController,
  String nationalityValue,
  TextEditingController mobilenumberController,
  String fullName,
) async {}
