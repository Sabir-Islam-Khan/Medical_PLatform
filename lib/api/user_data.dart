import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';
import 'package:http/http.dart' as http;
import '../../utils/error_handlers.dart';
import 'package:path/path.dart';

// function for getting basic user info
Future<void> getBasicUserInfo(BuildContext context) async {
  var userInfoURL = Uri.parse(userInfoTemp + userID.toString());
  var response = await http.get(userInfoURL, headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    BasicUserInfo userInfo = BasicUserInfo.fromJson(jsonDecode(response.body));
    givenName = userInfo.givenName;
    lastName = userInfo.lastName;
    userName = userInfo.username;

    if (givenName == null && lastName == null) {
      givenName = userInfo.username;
    }
    //asd
    phoneNum = userInfo.phoneNum;
    if (phoneNum == null) {
      phoneNum = 'No phone number';
    }
    cartLink = userInfo.userLinks.cartLink;
    ordersLink = userInfo.userLinks.ordersLink;
    receiptsLink = userInfo.userLinks.receiptsLink;
    selfLink = userInfo.userLinks.selfLink;
    profilePicLink = userInfo.userLinks.profilePicLink;
  } else {
    print("error in getting basic user info");
    sessionExpiredDialog(context);
  }
}

// get user booking

// function for getting detailed user info

Future<DetailedUserInfo> getDetailedUserInfo(BuildContext context) async {
  DetailedUserInfo detailedUserInfo;
  // print("Token is === \n \n \n $token");
  var userInfoURL = Uri.parse(userInfoTemp + userID.toString());
  // print("user info url \n \n $userInfoURL \n");
  var response = await http.get(userInfoURL, headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    detailedUserInfo = DetailedUserInfo.fromJson(jsonDecode(response.body));
    userData = DetailedUserInfo.fromJson(jsonDecode(response.body));
    // print("DATA IS === ${response.body}");
    print(
        "heres the token bro \n \n $token \n \n webtemp $webTemp \n \n userId $userID \n \n");
  } else {
    errorDialog(context, 'Unable to retrieve detailed user info');
    print("error in getting detailed user info");
  }

  return detailedUserInfo;
}

// function to put user pic

Future<void> fixedputProfilePic(BuildContext context, File imageFile) async {
  String fileName = imageFile.path.split('/').last;
  var stream = new http.ByteStream(imageFile.openRead());
  stream.cast();
  var length = await imageFile.length();
  Map<String, String> headers = {
    'Authorization': 'Bearer ' + token,
    'Content-Type': 'image/jpeg',
    'Content_Disposition': 'attachment: filename=$fileName'
  };
  var uri =
      Uri.parse(webTemp + '/api/users/' + userID.toString() + '/upload_selfie');
  var request = new http.MultipartRequest("PUT", uri);
  var multipartFileSign = new http.MultipartFile('profile_pic', stream, length,
      filename: basename(imageFile.path));
  request.files.add(multipartFileSign);

  //add headers
  request.headers.addAll(headers);
  var response = await request.send();

  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}

// old upload funcion

Future<void> putProfilePic(BuildContext context, File file) async {
  String fileName = file.path.split('/').last;
  //String b64Image = base64Encode(AsyncSnapshot<)
  String profilePicURL = webTemp + '/api/users/' + 'upload_selfie';
  var jsonData = jsonEncode({
    'photo': base64Encode(File(file.path).readAsBytesSync()),
  });
  debugPrint(jsonData);
  var response = await http.put(Uri.parse(profilePicURL),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
        //'Content-Type': 'application/x-www-form-urlencoded',
        'Content_Disposition': 'attachment: filename=$fileName'
      },
      body: jsonData);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
    errorDialog(context, 'Unable to upload profile picture');
  }
}
