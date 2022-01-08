import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

import '../../utils/error_handlers.dart';

Future<http.Response> getPosts(BuildContext context) async {
  var response = await http
      .get(Uri.parse(webTemp + '/api/posts'), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    return response;
  } else {
    errorDialog(context, 'Unable to get posts!');
    return null;
  }
}

// function to fetch author details
Future<http.Response> getAuthorDetails(BuildContext context) async {
  var response = await http
      .get(Uri.parse(webTemp + '/api/posts'), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    var response2 = await http.get(Uri.parse(data['items']['_links']['author']),
        headers: <String, String>{
          'Authorization': 'Bearer ' + token,
        });
    return response2;
  } else {
    errorDialog(context, 'Unable to get Author Details!');
    return null;
  }
}
