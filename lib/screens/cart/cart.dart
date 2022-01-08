import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/address_provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/screens/cart/components/bottom_nav_bar.dart';
import 'package:shrink/screens/cart/components/dropoff_location.dart';
import 'package:shrink/screens/global_component/appbar_with_cart.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';
import 'Components/cart_item_card.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  //const CartPage({ Key? key }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    Provider.of<CartObj>(context, listen: false).updateCart(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DeliveryFees>(context, listen: false).getFeesData();
    var sampleData = Provider.of<AddressInformation>(context, listen: false)
        .getUserAddressData;
    List<List> cartArr = Provider.of<CartObj>(context).getCartObj;

    List priceArr = Provider.of<DeliveryFees>(context).getFees;
    return Scaffold(
      backgroundColor: globalColor_12LightGrey,
      appBar: appbarWithCart(context),
      bottomNavigationBar: bottomNavBar(context, priceArr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            buildList(
              context,
              cartArr,
            ),
            SizedBox(
              height: ScreenSize.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.06),
              child: priceArr[0] == null || priceArr[0] == 0.00
                  ? SizedBox()
                  : Text(
                      "PickUp",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.06,
              ),
              child: priceArr[1] == null || priceArr[1] == 0.00
                  ? SizedBox()
                  : Column(
                      children: [
                        for (String i in cartSupplierNamesGlobal)
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  width: ScreenSize.width * 0.6,
                                  child: Text(
                                    i,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize.width * 0.06,
                                  ),
                                  child: priceArr[1] == null
                                      ? SizedBox()
                                      : Text(
                                          r"$" +
                                              "${priceArr[1] / 100 / cartSupplierNamesGlobal.length} ",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[600],
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.06,
              ),
              child: priceArr[1] == null || priceArr[1] == 0.00
                  ? SizedBox()
                  : Column(
                      children: [
                        for (Map<String, dynamic> i in sampleData["items"])
                          i["is_active"] == true ? LocationCard(i) : SizedBox(),
                      ],
                    ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.02,
            ),
            priceArr[1] == null || priceArr[1] == 0.00
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenSize.width * 0.06,
                        ),
                        child: Text(
                          "Tax",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenSize.width * 0.06,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Singapore - 7% GST",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            priceArr[2] == null
                                ? SizedBox()
                                : Text(
                                    "${priceArr[2] / 100}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[600],
                                    ),
                                  ),
                            SizedBox(
                              width: ScreenSize.width * 0.06,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: ScreenSize.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
