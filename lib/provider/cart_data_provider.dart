import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/cart_data.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

class TotalCartQty extends ChangeNotifier {
  int quantity;

  int getTotalCartQty(BuildContext context) {
    quantity ?? updateQuantity(context);
    return quantity ?? 0;
  }

  incrementQty(int amount) {
    quantity += amount;
    notifyListeners();
  }

  decrementQty(int amount) {
    quantity -= amount;
    notifyListeners();
  }

  updateQuantity(BuildContext context) async {
    quantity = await getCartMeta(context);
    notifyListeners();
  }
}

class TotalCost extends ChangeNotifier {
  double totalCost = 0.0;

  double get getTotalCost {
    return totalCost;
  }

  incrementCost(double amount) {
    totalCost += amount;
    notifyListeners();
  }

  decrementCost(double amount) {
    totalCost -= amount;
    notifyListeners();
  }

  resetCost() {
    totalCost = 0.0;
    notifyListeners();
  }
}

class IndexItemQty extends ChangeNotifier {
  Map itemQty = Map();

  Map get getIndexItemQty {
    return itemQty;
  }

  setIndexItemQty(int index, int quantity) {
    itemQty[index] = quantity;
    // notifyListeners();
  }

  incrementQty(int index, int amount) {
    itemQty[index] += amount;
    notifyListeners();
  }

  decrementQty(int index, int amount) {
    itemQty[index] -= amount;
    if (itemQty[index] == 0) {
      itemQty.remove(index);
    }
    notifyListeners();
  }

  resetItemQty() {
    itemQty.clear();
    notifyListeners();
  }
}

class DeliveryFees extends ChangeNotifier {
  List data = [
    0.00,
    0.00,
    0.00,
    0.00,
  ];
  getFeesData() async {
    List fetchedData = await getDeliveryFees();

    data = fetchedData;

    notifyListeners();
  }

  get getFees {
    return data;
  }
}

class CartObj extends ChangeNotifier {
  List<List> cart = [];

  List get getCartObj {
    return cart;
  }

  updateCart(BuildContext context) async {
    List tempArr = [];

    cart.clear();
    // Provider.of<TotalCost>(context, listen: false).resetCost();
    //Provider.of<IndexItemQty>(context, listen: false).resetItemQty();
    tempArr = await getCartInfo(context, userID);
    extractCartItems(context, tempArr);
  }

  decrementQtyOfItem(int itemIndex, int amount) {
    cart[itemIndex][4] -= amount;
    if (cart[itemIndex][4] == 0) {
      cart.removeAt(itemIndex);
    }
    notifyListeners();
  }

  incrementQtyOfItem(int itemIndex, int amount) {
    cart[itemIndex][4] += amount;
    notifyListeners();
  }

  extractCartItems(BuildContext context, List arr) {
    CartItemsArr cartItemsArr;
    CartLinks cartLinks;
    List tempArr = [];

    for (int i = 0; i < arr.length; i++) {
      cartItemsArr = arr[i];
      cartLinks = cartItemsArr.links;
      tempArr.add(webTemp + cartLinks.featurePic);
      // tempArr.add(cartItemsArr.brand + " " + cartItemsArr.model);
      if (cartItemsArr.brand == null) {
        tempArr.add(cartItemsArr.supplierName);
      } else {
        tempArr.add(cartItemsArr.brand + " " + cartItemsArr.model);
      }

      tempArr.add(cartItemsArr.amount / 100);
      tempArr.add(cartItemsArr.id);
      tempArr.add(cartItemsArr.quantity);
      tempArr.add(cartItemsArr.supplierName);
      cart.add(tempArr);
      if (cartSupplierNamesGlobal.contains(cartItemsArr.supplierName) ==
          false) {
        cartSupplierNamesGlobal.add(cartItemsArr.supplierName);
      }
      Provider.of<TotalCost>(context, listen: false)
          .incrementCost((cartItemsArr.amount / 100) * cartItemsArr.quantity);
      tempArr = [];
    }
    print("Cart supplier names .... \n " +
        cartSupplierNamesGlobal.toString() +
        "\n");
    Provider.of<TotalCartQty>(context, listen: false).updateQuantity(context);
    notifyListeners();
  }
}
