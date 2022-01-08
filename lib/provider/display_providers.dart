import 'package:flutter/material.dart';
import 'package:shrink/api/product_data.dart';

class AmountDisplay extends ChangeNotifier {
  int _displayNum = 1;

  int get getDisplayNum {
    return _displayNum;
  }

  incrementAmount() {
    _displayNum += 1;
    notifyListeners();
  }

  decrementAmount() {
    if (_displayNum > 1) {
      _displayNum -= 1;
      notifyListeners();
    }
  }

  resetAmount() {
    _displayNum = 1;
    notifyListeners();
  }
}

class DescriptionDisplay extends ChangeNotifier {
  String description;

  String get getDescription {
    return description ?? '';
  }

  updateDescription(BuildContext context, int productID) async {
    description = await getProductDescription(context, productID);
    notifyListeners();
  }
}
