import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

import '../../utils/error_handlers.dart';

Future<void> getSessionID(BuildContext context) async {
  String paymentURL = webTemp + '/api/stripe_pay';
  var response =
      await http.get(Uri.parse(paymentURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    PaymentTokens paymentTokens = PaymentTokens.fromJson(
      jsonDecode(response.body),
    );
    cartID = paymentTokens.cartID;
    sessionID = paymentTokens.sessionID;
    publicKey = paymentTokens.publicKey;
  } else {
    print("ERROR in getting session id.. status code ${response.statusCode}");
    errorDialog(context, 'Could not get session ID');
  }
}

// function to redirect to stripe

Future<void> redirectToStripe(WebViewController webViewController) async {
  final redirectToCheckoutJs = '''
                              var stripe = Stripe(\'$publicKey\');
                              stripe.redirectToCheckout({sessionId: '$sessionID'}).then(function (result) {result.error.message = 'Error'});
                              ''';
  webViewController.runJavascript(redirectToCheckoutJs);
}

Future<void> getSuccessPayment(BuildContext context) async {
  String successURL = webTemp + '/api/successful/' + cartID.toString();
  var response =
      await http.get(Uri.parse(successURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    print(
        "\n \n \n Payment Success \n \n \n status code ${response.statusCode}");
    //popUpDialog(context, 'Payment Outcome', 'Payment is Successful!');
  } else {
    print(
        "Error in payment success ..\n\n\n response code ${response.statusCode} \n\n\n");
  }
}

Future<List> getOrderHistory(BuildContext context) async {
  //only 1 page of order returned
  List dataArr = [];
  String orderURl = webTemp + '/api/orders';
  var response = await http.get(Uri.parse(orderURl), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    UserOrders userOrders = UserOrders.fromJson(jsonDecode(response.body));
    dataArr = userOrders.orderArr;
  } else {
    errorDialog(context, 'No Order Info');
  }

  return dataArr;
}
