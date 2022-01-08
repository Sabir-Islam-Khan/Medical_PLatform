import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/product_and_promo.dart';

import 'package:shrink/variables/globalVar.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> dataArr = Provider.of<ProductObj>(context).getProductArray;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 0.0,
      ),
      // shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: dataArr.length,
      itemBuilder: (BuildContext context, int widgetIndex) {
        // final promoIndex = widgetIndex - 1;

        return Padding(
          padding: EdgeInsets.only(
            left: 0,
            right: 0,
            bottom: 0,
          ),
          child: BuildProductCard(
            itemIndex: widgetIndex,
            proID: dataArr[widgetIndex][0],
            proName: dataArr[widgetIndex][1],
            picURL: dataArr[widgetIndex][2],
            cost: dataArr[widgetIndex][3],
            discount: false,
            discountValue: 30,
            isLiked: favouriteProductIdGlobal.contains(dataArr[widgetIndex][0])
                ? true
                : false,
          ),
        );
      },
    );
  }
}
