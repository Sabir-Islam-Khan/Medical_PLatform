import 'package:flutter/material.dart';

class SlideUpMenuLogic extends ChangeNotifier {
  bool logic = false;
  int companyID;

  bool get getLogic {
    return logic;
  }

  int get getCompanyID {
    return companyID;
  }

  toggleLogic(int companyID) {
    logic = !logic;
    companyID = companyID;
    notifyListeners();
  }
}

class CheckBoxLogics extends ChangeNotifier {
  Map<String, bool> truthTable = {
    'fever': false,
    'headache': false,
    'chestpain': false,
    'breathless': false
  };
  bool checkFlag = false;

  Map<String, bool> get getTruthTable {
    return truthTable;
  }

  bool get getCheckFlag {
    return checkFlag;
  }

  toggleIndexLogic(String key) {
    truthTable[key] = !truthTable[key];
    notifyListeners();
  }

  checkLogics() {
    if (truthTable['fever'] == true ||
        truthTable["headache"] == true ||
        truthTable["chestpain"] == true ||
        truthTable["breathless"] == true) {
      checkFlag = true;
    }
    notifyListeners();
  }

  resetCheckLogics() {
    checkFlag = false;
    truthTable = {
      'fever': false,
      'headache': false,
      'chestpain': false,
      'breathless': false
    };
    notifyListeners();
  }
}
