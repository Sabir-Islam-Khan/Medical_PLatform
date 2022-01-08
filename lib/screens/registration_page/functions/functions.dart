import 'package:flutter/material.dart';
import 'package:shrink/screens/registration_page/components/dialogue.dart';

// function to check field states

bool checkStates(
    String emailBox, String passBox, bool checkBox, BuildContext context) {
  int i = 0;
  bool checkFlag = false;
  var errorArray = [];

  errorArray.add('Please fill in');

  if (checkBox == false) {
    i++;
    errorArray.add('checkbox');
  }
  // if (userBox.isEmpty) {
  //   i++;
  //   errorArray.add('username');
  // }
  if (emailBox.isEmpty ||
      ((emailBox.contains('@') && emailBox.contains('.com')) == false)) {
    i++;
    errorArray.add('valid email');
  }
  if (passBox.isEmpty) {
    i++;
    errorArray.add('password');
  }

  if (i == 0) {
    checkFlag = true;
  } else {
    popUpDialog('Missing entry', errorArray.join(" "), context);
  }

  return checkFlag;
}
