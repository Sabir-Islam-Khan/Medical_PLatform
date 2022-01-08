import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/product_and_promo.dart';

import 'package:shrink/screens/favourites/components/favourite_products_card.dart';

import 'package:shrink/variables/globalVar.dart';

class FavouriteProductScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List> dataArr = Provider.of<ProductObj>(context).getProductArray;
    List<List> promoArr = Provider.of<PromoObj>(context).getPromoArray;
    List<List> newList = dataArr + promoArr;

    return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newList.length,
        itemBuilder: (BuildContext context, int widgetIndex) {
          final itemIndex = widgetIndex;

          return FavouriteProductCard(
            itemIndex: itemIndex,
            proID: newList[itemIndex][0],
            proName: newList[itemIndex][1],
            picURL: newList[itemIndex][2],
            cost: newList[itemIndex][3],
            discount: promoListIdGlobal.contains(newList[itemIndex][0])
                ? true
                : false,
            discountValue: 30,
            isLiked: favouriteProductIdGlobal.contains(newList[itemIndex][0])
                ? true
                : false,
          );
        },
      ),
    );
  }
}
