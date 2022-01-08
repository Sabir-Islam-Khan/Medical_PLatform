import 'package:flutter/cupertino.dart';
import 'package:shrink/api/favourites_manager.dart';
import 'package:shrink/variables/globalVar.dart';

class FavouriteProductProvider extends ChangeNotifier {
  List favouriteProducts;

  fetchFavouriteProducts() async {
    favouriteProducts = await getFavouriteProductsIdList();

    favouriteProductIdGlobal = favouriteProducts;
    notifyListeners();
  }
}
