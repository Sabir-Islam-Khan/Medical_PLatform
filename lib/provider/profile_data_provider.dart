import 'package:flutter/cupertino.dart';
import 'package:shrink/api/profile_data_manager.dart';

class ProfileDataProvider extends ChangeNotifier {
  List<String> designationTypes = ["Select Designation"];
  List<String> currencyTypes = ["Select Preferred Currency"];
  List<String> identityTypes = ["Select ID Type"];

  fetchDesignations() async {
    var data = await getDesignations();

    for (int i = 0; i < data["_meta"]["total_items"]; i++) {
      if (!designationTypes.contains(data['items'][i]["name"])) {
        designationTypes.add(data['items'][i]["name"]);
      }
    }
    // print("designations are === \n \n $designationTypes \n\n");
    notifyListeners();
  }

  get getDesignationValues {
    return designationTypes;
  }

  fetchCurrencyTypes() async {
    var data = await getCurrencyTypes();

    for (int i = 0; i < data["_meta"]["total_items"]; i++) {
      if (!currencyTypes.contains(data['items'][i]["name"])) {
        currencyTypes.add(data['items'][i]["name"]);
      }
    }
    notifyListeners();
  }

  get getCurrencyValues {
    return currencyTypes;
  }

  fetchIdTypes() async {
    var data = await getIdentifications();

    for (int i = 0; i < data["_meta"]["total_items"]; i++) {
      if (!identityTypes.contains(data['items'][i]["type"])) {
        identityTypes.add(data['items'][i]["type"]);
      }
    }

    notifyListeners();
  }

  get getIdentityValues {
    return identityTypes;
  }
}
