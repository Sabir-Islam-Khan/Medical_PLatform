import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/product_and_promo.dart';

import 'package:shrink/screens/promo_page/components/promo_card.dart';
import 'package:shrink/variables/globalVar.dart';

class PromoGrid extends StatelessWidget {
  const PromoGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> promoArr = Provider.of<PromoObj>(context).getPromoArray;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 0.0,
      ),
      // shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: promoArr.length,
      itemBuilder: (BuildContext context, int widgetIndex) {
        // final promoIndex = widgetIndex - 1;

        return Padding(
          padding: EdgeInsets.only(
            left: 0,
            right: 0,
            bottom: ScreenSize.height * 0.001,
          ),
          child: BuildPromoCard(
            itemIndex: widgetIndex,
            proID: promoArr[widgetIndex][0],
            proName: promoArr[widgetIndex][1],
            picURL: promoArr[widgetIndex][2],
            cost: promoArr[widgetIndex][3],
            discount: true,
            discountValue: 30,
            isLiked: favouriteProductIdGlobal.contains(promoArr[widgetIndex][0])
                ? true
                : false,
          ),
        );
      },
    );
  }
}
