import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shrink/variables/globalVar.dart';

import 'package:shrink/variables/routes.dart';

Future<Map<String, dynamic>> getReceipts() async {
  var receiptUrl = Uri.parse(webTemp + "/api/users/$userID/user_receipts");
  var response = await http.get(
    receiptUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  var dataArr = jsonDecode(response.body);

  // print("Address URL  response \n \n ${response.body} \n \n");
  return dataArr;
}

Future<Map<String, dynamic>> getMedicalCerts() async {
  var receiptUrl = Uri.parse(webTemp + "/api/users/$userID/user_medical_certs");
  var response = await http.get(
    receiptUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  var dataArr = jsonDecode(response.body);

  return dataArr;
}

Future<Map<String, dynamic>> getReceiptsDetails(int id) async {
  var receiptDetailsUrl =
      Uri.parse(webTemp + "/api/receipt/$id/receipt_cart_items");
  var response = await http.get(
    receiptDetailsUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  var dataArr = jsonDecode(response.body);

  // print("Address URL  response \n \n ${response.body} \n \n");
  return dataArr;
}
