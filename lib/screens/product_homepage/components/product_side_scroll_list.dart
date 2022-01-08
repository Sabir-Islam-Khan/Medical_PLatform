import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/product_and_promo.dart';

import 'package:shrink/screens/product_homepage/components/product_card.dart';
import 'package:shrink/variables/globalVar.dart';

class ProductSideScrollList extends StatelessWidget {
  // const ProductSideScrollList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> dataArr = Provider.of<ProductObj>(context).getProductArray;
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: (dataArr.length * 2),
        itemBuilder: (BuildContext context, int widgetIndex) {
          if (widgetIndex.isOdd)
            return Divider(
              color: Colors.transparent,
            );

          final itemIndex = widgetIndex ~/ 2;

          return ProductCard(
            itemIndex: itemIndex,
            proID: dataArr[itemIndex][0],
            proName: dataArr[itemIndex][1],
            picURL: dataArr[itemIndex][2],
            cost: dataArr[itemIndex][3],
            discount: false,
            discountValue: 30,
            isLiked: favouriteProductIdGlobal.contains(dataArr[itemIndex][0])
                ? true
                : false,
          );
        },
      ),
    );
  }
}
