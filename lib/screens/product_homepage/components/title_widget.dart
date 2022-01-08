import 'package:flutter/material.dart';

import 'package:shrink/screens/marketplace_page/marketplace_page.dart';
import 'package:shrink/screens/promo_page/promo_page.dart';
import 'package:shrink/styles/colors.dart';

Widget titleWidget(
  BuildContext ctx,
  String heading,
  String pageName,
) {
  return Container(
    padding: EdgeInsets.only(top: 9, left: 10, bottom: 10, right: 20),
    child: GestureDetector(
      onTap: () {
        if (pageName == "marketplace") {
          Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => MarketplaceSearchPage(),
            ),
          );
        } else if (pageName == "promo") {
          Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => PromoPage(),
            ),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                'See All   ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '>',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: globalColor_10Orange,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
