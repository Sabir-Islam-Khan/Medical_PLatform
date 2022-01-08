// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/favourites_manager.dart';
import 'package:shrink/provider/display_providers.dart';

import 'package:shrink/screens/product_page/product_page.dart';
import 'package:shrink/utils/money_convert.dart';
import 'package:shrink/variables/globalVar.dart';

class FavouriteProductCard extends StatefulWidget {
  //const FavouriteProductCard({ Key? key }) : super(key: key);
  final int itemIndex;
  final int proID;
  final String proName;
  final String picURL;
  final int cost;
  final bool discount;
  final int discountValue;
  bool isLiked;
  FavouriteProductCard({
    @required this.itemIndex,
    @required this.proID,
    @required this.proName,
    @required this.picURL,
    @required this.cost,
    @required this.discount,
    @required this.discountValue,
    @required this.isLiked,
  });
  @override
  _FavouriteProductCardState createState() => _FavouriteProductCardState();
}

class _FavouriteProductCardState extends State<FavouriteProductCard> {
  @override
  Widget build(BuildContext context) {
    double price = MoneyConvert().centToDollar(widget.cost);
    return widget.isLiked == true
        ? Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 5.0,
                ),
                margin: EdgeInsets.all(1.0),
                width: ScreenSize.width * 0.42,
                height: ScreenSize.height * 0.35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {
                    Provider.of<DescriptionDisplay>(context, listen: false)
                        .updateDescription(context, widget.proID);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductPage(
                          cost: widget.cost,
                          proID: widget.proID,
                          picURL: widget.picURL,
                          proName: widget.proName,
                          itemIndex: widget.itemIndex,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ScreenSize.height * 0.01,
                      ),
                      Center(
                        child: Container(
                          width: ScreenSize.width * 0.18,
                          height: ScreenSize.height * 0.14,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(widget.picURL),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.height * 0.01,
                      ),
                      Text(
                        widget.proName,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$$price",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                decoration: widget.discount
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: widget.discount
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                            widget.isLiked == false
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.isLiked = !widget.isLiked;
                                      });
                                      likeProduct(widget.proID, context);
                                    },
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.grey,
                                      size: ScreenSize.height * 0.025,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          widget.isLiked = !widget.isLiked;
                                        },
                                      );
                                      unlikeProduct(widget.proID, context);
                                    },
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.blue,
                                      size: ScreenSize.height * 0.025,
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Text(
                        "Princeton-Plaionsboro",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              widget.discount == true
                  ? Positioned(
                      left: ScreenSize.width * 0.03,
                      top: 1,
                      child: Container(
                        color: Colors.red[800],
                        width: 24,
                        height: 48,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.discountValue.toString() + "%",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                            Text(
                              "off",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          )
        : SizedBox.shrink();
  }
}
