import 'dart:convert';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getDesignations() async {
  var designationsUrl = Uri.parse(webTemp + '/api/designations'.toString());

  var response = await http.get(designationsUrl, headers: <String, String>{
    'Authorization': "Bearer " + token,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    return data;
  } else {
    print("Can't fetch designation.. error code ${response.statusCode}");
    return null;
  }
}

Future<Map<String, dynamic>> getCurrencyTypes() async {
  var currencyUrl = Uri.parse(webTemp + "/api/currencies".toString());
  var response = await http.get(currencyUrl, headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    return data;
  } else {
    print("Error in getting currency \n \n status code ${response.statusCode}");
    return null;
  }
}

Future<Map<String, dynamic>> getIdentifications() async {
  var indentityUrl = Uri.parse(webTemp + "/api/identifications".toString());

  var response = await http.get(indentityUrl, headers: <String, String>{
    "Authorization": "Bearer " + token,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    return data;
  } else {
    print("Error in fetching indentity.. status ${response.statusCode}");
    return null;
  }
}
