import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/product_and_promo.dart';

import 'package:shrink/screens/product_homepage/components/product_card.dart';
import 'package:shrink/variables/globalVar.dart';

class PromoSideScrollList extends StatelessWidget {
  // const PromoSideScrollList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> promoArr = Provider.of<PromoObj>(context).getPromoArray;
    return Padding(
      padding: EdgeInsets.only(left: 3.0, right: 3.0),
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: (promoArr.length * 2),
        itemBuilder: (BuildContext context, int widgetIndex) {
          if (widgetIndex.isOdd)
            return Divider(
              color: Colors.transparent,
            );

          final promoIndex = widgetIndex ~/ 2;

          return ProductCard(
            itemIndex: promoIndex,
            proID: promoArr[promoIndex][0],
            proName: promoArr[promoIndex][1],
            picURL: promoArr[promoIndex][2],
            cost: promoArr[promoIndex][3],
            discount: true,
            discountValue: 30,
            isLiked: favouriteProductIdGlobal.contains(
              promoArr[promoIndex][0],
            )
                ? true
                : false,
          );
        },
      ),
    );
  }
}
