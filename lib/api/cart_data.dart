import 'dart:convert';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<int> getCartMeta(BuildContext context) async {
  int totalItems = 0;

  String cartURl = webTemp + '/api/carts/' + userID.toString();
  var response = await http.get(Uri.parse(cartURl), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    CartUserInfo cartUserInfo = CartUserInfo.fromJson(
      jsonDecode(response.body),
    );
    totalItems = cartUserInfo.cartItemsCount;
  } else {}

  return totalItems;
}

// function to get cart data
Future<List> getCartInfo(BuildContext context, int index) async {
  print("cart info called");
  List dataArr = [];
  String cartURl = webTemp + '/api/carts/' + userID.toString() + '/cart_items';
  var response = await http.get(Uri.parse(cartURl), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    print("SUCCESS IN gerCartInfo");
    CartInfo cartInfo = CartInfo.fromJson(
      jsonDecode(response.body),
    );
    dataArr = cartInfo.itemsArr;
  } else {
    print("Error in get cart info .. code == ${response.statusCode}");
  }

  return dataArr;
}

Future<int> checkProductInCart(
    BuildContext context, int productID, int cartID) async {
  int _exist = -1;

  List cartArr = await getCartInfo(context, cartID);
  for (int i = 0; i < cartArr.length; i++) {
    //  print(cartArr[i]);
    CartItemsArr cartItemsArr = cartArr[i];
    if (cartItemsArr.productID == productID) {
      _exist = cartItemsArr.id;
      break;
    }
  }
  return _exist;
}

// function to put item to cart

Future<void> putItemToCart(
  BuildContext context,
  int productID,
  int amountToAdd,
) async {
  print(productID);
  String addURL = productsTemp + '/' + productID.toString() + '/add_item';
  var jsonData = jsonEncode({
    'quantity': amountToAdd,
  });
  var response = await http.put(
    Uri.parse(addURL),
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
    body: jsonData,
  );
  if (response.statusCode == 200) {
    print("ADDING ITEM SUCCESS");
  } else {
    //  errorDialog(context, 'Unable to add item to cart');
    print("ERROR HERE, error code ${response.statusCode}");
  }
}

// function to put item to cart
Future<void> removeItemFromCart(BuildContext context, int cartItemID) async {
  String removeItemURL =
      webTemp + '/api/cart_items/' + cartItemID.toString() + '/remove_item';
  var response =
      await http.put(Uri.parse(removeItemURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    print("success");
  } else {
    print("Error in removing item... code is ${response.statusCode}");
  }
}

// add item to crt
Future<void> addAmountToCart(BuildContext context, int cartItemID) async {
  String addURL =
      webTemp + '/api/cart_items/' + cartItemID.toString() + '/add_quantity';

  var response = await http.put(
    Uri.parse(addURL),
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );
  if (response.statusCode == 200) {
    print("Success");
  } else {
    print(response.statusCode);
  }
}

Future<void> subtractAmountToCart(BuildContext context, int cartItemID) async {
  String addURL = webTemp +
      '/api/cart_items/' +
      cartItemID.toString() +
      '/subtract_quantity';
  var response = await http.put(Uri.parse(addURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    print("SUCCESS");
  } else {
    print(response.statusCode);
  }
}

Future<List> getDeliveryFees() async {
  String cartURl = webTemp + '/api/carts/' + userID.toString();

  var response = await http.get(
    Uri.parse(cartURl),
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  var decodedData = jsonDecode(response.body);

  List arr = [];
  arr.add(decodedData["cart_item_subtotal"]);
  arr.add(decodedData["delivery_subtotal"]);
  arr.add(decodedData["tax_subtotal"]);
  arr.add(decodedData["grand_total"]);
  // print("response is ...... $decodedData");
  return arr;
}
