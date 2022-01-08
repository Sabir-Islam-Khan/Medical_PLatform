import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/provider/medical_feed_provider.dart';
import 'package:shrink/provider/product_and_promo.dart';
import 'package:shrink/provider/user_provider.dart';
import 'package:shrink/screens/homepage/homepage.dart';
import '../../screens/landing_page/landing_page.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

import '../../utils/error_handlers.dart';

// function for loggin users in
Future<void> loginUser(
    BuildContext context, String username, String password) async {
  String credentials = username + ":" + password;
  String encodedCred = base64Url.encode(utf8.encode(credentials));
  String b64BAHeader = "Basic " + encodedCred;

  var response = await http.post(loginURL, headers: <String, String>{
    'Authorization': b64BAHeader,
  });
  if (response.statusCode == 401) {
    print("status is ${response.statusCode}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LandingPage(
          status: 401,
        ),
      ),
    );
  } else if (response.statusCode == 200) {
    LoginInfo user = LoginInfo.fromJson(jsonDecode(response.body));
    userID = user.userID;
    token = user.token;

    //SAVING ENCRYPTED LOGIN INFO FOR AUTOLOGIN

    final key =
        encrypt.Key.fromUtf8(autoLoginEncKey); // key used for encryption
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encryptedUsername = encrypter.encrypt(username, iv: iv);
    final encryptedPassword = encrypter.encrypt(password, iv: iv);

    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("isLogged", true);
        prefs.setString("data1", encryptedUsername.base64);
        prefs.setString("data2", encryptedPassword.base64);
      },
    );

    Provider.of<UserInformation>(context, listen: false)
        .updateDisplayInfo(context);
    Provider.of<CompanyObj>(context, listen: false).updateArray(context);
    Provider.of<ProductObj>(context, listen: false).updateProductArray(context);
    Provider.of<PromoObj>(context, listen: false).updatePromoArray(context);
    Provider.of<MedicalPostObj>(context, listen: false)
        .updateMedicalPosts(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
      (Route<dynamic> route) => false,
    );
  } else {
    errorDialog(context, 'Failed to connect');
  }
}

// delete user token

Future<void> deleteToken(BuildContext context) async {
  SharedPreferences.getInstance().then((prefs) {
    debugPrint("setting isLogged false");
    prefs.setBool("isLogged", false);
  });

  // INFO: THIS ENDPOINT BELOW DOESNT WORK, MOVE THE SHAREDPREF CALL TO THE END AFTER FIXIN
  var response = await http.delete(loginURL, headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
  } else {
    errorDialog(context, 'Unable to delete token');
  }
}

// register user function


