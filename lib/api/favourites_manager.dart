import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/provider/favourite_product_provider.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';
import 'package:http/http.dart' as http;

// product section
Future<void> likeProduct(int id, BuildContext context) async {
  print("id is $id");

  var likeProductUrl = Uri.parse(webTemp + "/api/like_product/$id/like");

  var response = await http.put(
    likeProductUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("Liking product successfull");
    Provider.of<FavouriteProductProvider>(context, listen: false)
        .fetchFavouriteProducts();
  } else {
    print("Couldn't like .. \n \n ${response.statusCode}");
  }
}

Future<void> unlikeProduct(int id, BuildContext context) async {
  print("id is $id");

  var unlikeProductUrl = Uri.parse(webTemp + "/api/like_product/$id/unlike");

  var response = await http.put(
    unlikeProductUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("Unliking product successfull");
    Provider.of<FavouriteProductProvider>(context, listen: false)
        .fetchFavouriteProducts();
  } else {
    print("Couldn't unlike .. \n \n ${response.statusCode}");
  }
}

Future<List> getFavouriteProductsIdList() async {
  List idArray = [];
  var favouriteProductsUrl =
      Uri.parse(webTemp + "/api/users/$userID/user_liked_products");

  var response = await http.get(
    favouriteProductsUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);

    for (int i = 0; i < decodedData["_meta"]["total_items"]; i++) {
      idArray.add(decodedData["items"][i]["product_id"]);
    }
  } else {
    print(
      "ERROR IN getting favourite list .. error code is ${response.statusCode}",
    );
  }
  return idArray;
}

/// clinic section

Future<void> likeClinic(int id, BuildContext context) async {
  print("id is $id");

  var unlikeProductUrl = Uri.parse(webTemp + "/api/like_business/$id/like");

  var response = await http.put(
    unlikeProductUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("liking business successfull");
    Provider.of<FavouriteClinicProvider>(context, listen: false)
        .fetchLikedCLinics();
  } else {
    print("Couldn't like .. \n \n ${response.statusCode}");
  }
}

Future<void> unlikeClinic(int id, BuildContext context) async {
  print("id is $id");

  var unlikeProductUrl = Uri.parse(webTemp + "/api/like_business/$id/unlike");

  var response = await http.put(
    unlikeProductUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("Unliking clinic successfull");
    Provider.of<FavouriteClinicProvider>(context, listen: false)
        .fetchLikedCLinics();
  } else {
    print("Couldn't unlike .. \n \n ${response.statusCode}");
  }
}

Future<List> getFavouriteClinicsIdList() async {
  List idArray = [];
  var favouriteProductsUrl =
      Uri.parse(webTemp + "/api/users/$userID/user_liked_businesses");

  var response = await http.get(
    favouriteProductsUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);

    for (int i = 0; i < decodedData["_meta"]["total_items"]; i++) {
      idArray.add(decodedData["items"][i]["business_id"]);
    }
  } else {
    print(
      "ERROR IN getting favourite list .. error code is ${response.statusCode}",
    );
  }
  return idArray;
}

// method to like post

Future<void> likePost(int id) async {
  print("id is $id");

  var likePostUrl = Uri.parse(webTemp + "/api/like_post/$id/like");

  var response = await http.put(
    likePostUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("liking post successfull");
  } else {
    print("Couldn't like .. \n \n ${response.statusCode}");
  }
}

// method to unlike post

Future<void> unlikePost(int id) async {
  print("id is $id");

  var unlikepostUrl = Uri.parse(webTemp + "/api/like_post/$id/unlike");

  var response = await http.put(
    unlikepostUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("Unliking clinic successfull");
  } else {
    print("Couldn't unlike .. \n \n ${response.statusCode}");
  }
}

Future<List> getFavouritePostsIdList() async {
  List idArray = [];
  var favouritePostsUrl =
      Uri.parse(webTemp + "/api/users/$userID/user_liked_posts");

  var response = await http.get(
    favouritePostsUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);

    for (int i = 0; i < decodedData["_meta"]["total_items"]; i++) {
      idArray.add(decodedData["items"][i]["post_id"]);
    }
  } else {
    print(
      "ERROR IN getting favourite list .. error code is ${response.statusCode}",
    );
  }
  return idArray;
}
