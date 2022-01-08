import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/variables/globalVar.dart';

import '../../../api/cart_data.dart';

Widget buildList(BuildContext context, List<List> cartArr) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: cartArr.length * 2,
    itemBuilder: (BuildContext context, int widgetIndex) {
      if (widgetIndex.isOdd) {
        return Divider(
          color: Colors.transparent,
        );
      }

      final itemIndex = widgetIndex ~/ 2;

      if (itemIndex >= cartArr.length) {
        dataGenerator(itemIndex);
      }

      return SingleChildScrollView(
        child: buildRow(
          context,
          itemIndex,
          cartArr[itemIndex][0],
          cartArr[itemIndex][1],
          cartArr[itemIndex][2],
          cartArr[itemIndex][3],
          cartArr[itemIndex][4],
          cartArr[itemIndex][5],
        ),
      );
    },
  );
}

dataGenerator(int index) {}

Widget buildRow(
  BuildContext context,
  int index,
  String picURL,
  String proName,
  double proCost,
  int cartItemID,
  int quantity,
  String supplierName,
) {
  if (!Provider.of<IndexItemQty>(context).getIndexItemQty.containsKey(index)) {
    Provider.of<IndexItemQty>(context).setIndexItemQty(index, quantity);
  }
  double totalCost = proCost * quantity;
  String displayTotals = totalCost.toStringAsFixed(2);
  return Container(
    color: Colors.grey[100],
    height: 100,
    width: ScreenSize.width * 1,
    child: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          height: 90.0,
          width: 80.0,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(picURL),
          ),
        ), //Possible bug here!
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ScreenSize.width * 0.45,
                color: Color.fromARGB(255, 152, 157, 199),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " " + supplierName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenSize.width * 0.55,
                child: Text(
                  proName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return Color.fromRGBO(200, 200, 200, 1);
                            }),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.all(0),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ))),
                        onPressed: () async {
                          if (quantity > 1) {
                            Provider.of<IndexItemQty>(context, listen: false)
                                .decrementQty(index, 1);
                            Provider.of<TotalCost>(context, listen: false)
                                .decrementCost(proCost);
                            Provider.of<TotalCartQty>(context, listen: false)
                                .decrementQty(1);
                            Provider.of<CartObj>(context, listen: false)
                                .decrementQtyOfItem(index, 1);

                            await subtractAmountToCart(context, cartItemID);
                          }
                          if (quantity == 1) {
                            Provider.of<IndexItemQty>(context, listen: false)
                                .decrementQty(index, 1);
                            Provider.of<TotalCost>(context, listen: false)
                                .decrementCost(proCost);
                            Provider.of<TotalCartQty>(context, listen: false)
                                .decrementQty(1);
                            Provider.of<CartObj>(context, listen: false)
                                .decrementQtyOfItem(index, 1);

                            await removeItemFromCart(context, cartItemID);
                          }
                        },
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    quantity.toString()
                    /*Provider.of<IndexItemQty>(context)
                          .getIndexItemQty[index]
                          .toString()*/
                    ,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Color.fromRGBO(200, 200, 200, 1);
                        }),
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        Provider.of<IndexItemQty>(context, listen: false)
                            .incrementQty(index, 1);
                        Provider.of<TotalCost>(context, listen: false)
                            .incrementCost(proCost);
                        Provider.of<TotalCartQty>(context, listen: false)
                            .incrementQty(1);
                        Provider.of<CartObj>(context, listen: false)
                            .incrementQtyOfItem(index, 1);
                        // print("cart item id is $cartItemID");
                        await addAmountToCart(context, cartItemID);
                      },
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    r"$" + displayTotals,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red[600],
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.width * 0.06,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  r"$ " + proCost.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[400],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
