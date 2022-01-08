import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shrink/api/favourites_manager.dart';
import 'package:shrink/api/post_manager.dart';
import 'package:shrink/variables/globalVar.dart';

class MedicalPostObj extends ChangeNotifier {
  Map<String, dynamic> _medicalPosts;
  int _totalPosts;

  Map<String, dynamic> get getMedicalPosts {
    return _medicalPosts;
  }

  int get getTotalPosts {
    return _totalPosts;
  }

  updateMedicalPosts(BuildContext context) async {
    Response response = await getPosts(context);
    _medicalPosts = json.decode(response.body);
    _totalPosts = _medicalPosts['_meta']['total_items'];
    notifyListeners();
  }

  fetchFavouritePosts() async {
    List favourites = await getFavouritePostsIdList();

    favouritePostIdGlobal = favourites;

    notifyListeners();
  }
}
