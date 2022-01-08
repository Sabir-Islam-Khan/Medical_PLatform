import 'package:flutter/cupertino.dart';
import 'package:shrink/api/address_manager.dart';
import 'package:shrink/variables/globalVar.dart';

class AddressInformation extends ChangeNotifier {
  var address;

  fetchUserAddress() async {
    address = await getUserAddress();
    userAddressGlobal = address;
    notifyListeners();
  }

  get getUserAddressData {
    return address;
  }
}
