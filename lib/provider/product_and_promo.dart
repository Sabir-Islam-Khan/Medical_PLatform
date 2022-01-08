import 'package:flutter/material.dart';
import 'package:shrink/api/product_data.dart';
import 'package:shrink/api/promo_manager.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

class ProductObj extends ChangeNotifier {
  List<List> _productArray = [];
  List<bool> _truthTable = [];

  List<List> get getProductArray {
    return _productArray;
  }

  List<bool> get getTruthTable {
    return _truthTable;
  }

  updateProductArray(BuildContext context) async {
    _productArray.clear();
    _truthTable.clear();
    List tempArr = await getProductArr(context);
    for (int i = 0; i < tempArr.length; i++) {
      _truthTable.add(true);
      extractInfo(tempArr[i], i);
    }
    notifyListeners();
  }

  extractInfo(ProductArr array, int index) {
    List tempArr = [];
    tempArr.add(array.productID);
    if (array.brand == null) {
      if (array.model == null) {
        tempArr.add('');
      } else {
        tempArr.add(array.model);
      }
    } else {
      tempArr.add(array.brand);
    }

    tempArr.add(webTemp + array.links.featurePic);
    tempArr.add(array.amount);
    _productArray.add(tempArr);
    _truthTable[index] = false;
  }
}

class PromoObj extends ChangeNotifier {
  List<List> _promoArray = [];
  List<bool> _truthTable = [];

  List<List> get getPromoArray {
    return _promoArray;
  }

  List<bool> get getTruthTable {
    return _truthTable;
  }

  updatePromoArray(BuildContext context) async {
    _promoArray.clear();
    _truthTable.clear();
    List tempArr = await getPromoArr(context);
    for (int i = 0; i < tempArr.length; i++) {
      _truthTable.add(true);
      extractInfo(tempArr[i], i);
    }
    notifyListeners();
  }

  extractInfo(ProductArr array, int index) {
    List tempArr = [];
    tempArr.add(array.productID);
    if (array.brand == null) {
      if (array.model == null) {
        tempArr.add('');
      } else {
        tempArr.add(array.model);
      }
    } else {
      tempArr.add(array.brand);
    }

    tempArr.add(webTemp + array.links.featurePic);
    tempArr.add(array.amount);
    _promoArray.add(tempArr);
    _truthTable[index] = false;
  }
}
