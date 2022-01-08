// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrink/screens/global_component/appbar_with_cart.dart';
import 'package:shrink/screens/product_page/components/bottom_nav_bar.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'components/product_details_widget.dart';

class ProductPage extends StatelessWidget {
  int cost, proID, itemIndex;
  String picURL, proName;
  ProductPage({
    Key key,
    this.cost,
    this.proID,
    this.picURL,
    this.proName,
    this.itemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithCart(context),
      bottomNavigationBar: productBottomNaVBar(context, proID, cost),
      backgroundColor: globalColor_12LightGrey,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage(
                    width: ScreenSize.width,
                    height: ScreenSize.width * 0.6,
                    placeholder: AssetImage('assets/logo/logo_1.png'),
                    image: NetworkImage(picURL),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/logo/logo_1.png');
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.02,
                  ),
                  productDetailWidget(
                    context,
                    cost,
                    proID,
                    itemIndex,
                    picURL,
                    proName,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
