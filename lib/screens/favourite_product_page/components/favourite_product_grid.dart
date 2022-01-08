import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/product_and_promo.dart';

import 'package:shrink/screens/favourites/components/favourite_products_card.dart';
import 'package:shrink/variables/globalVar.dart';

class FavouriteProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List> dataArr = Provider.of<ProductObj>(context).getProductArray;
    List<List> promoArr = Provider.of<PromoObj>(context).getPromoArray;
    List<List> addedList = dataArr + promoArr;
    List<List> filteredList = [];
    for (int i = 0; i < addedList.length; i++) {
      if (favouriteProductIdGlobal.contains(addedList[i][0])) {
        filteredList.add(addedList[i]);
      }
    }
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: filteredList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.1,
        // crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int widgetIndex) {
        // final promoIndex = widgetIndex - 1;

        return Padding(
          padding: EdgeInsets.only(
            left: ScreenSize.width * 0.02,
            right: ScreenSize.width * 0.02,
          ),
          child: FavouriteProductCard(
            itemIndex: widgetIndex,
            proID: filteredList[widgetIndex][0],
            proName: filteredList[widgetIndex][1],
            picURL: filteredList[widgetIndex][2],
            cost: filteredList[widgetIndex][3],
            discount: promoListIdGlobal.contains(filteredList[widgetIndex][0])
                ? true
                : false,
            discountValue: 30,
            isLiked: true,
          ),
        );
      },
    );
  }
}
