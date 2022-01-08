import 'package:flutter/material.dart';
import 'package:shrink/screens/telemedicine_clinics_page/components/buttons.dart';
import 'package:shrink/screens/telemedicine_clinics_page/components/cart_item_data.dart';

import 'package:shrink/variables/globalVar.dart';

Widget appbarElements(CartItemdata cartData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: ScreenSize.height * 0.04,
      ),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: ScreenSize.width * 0.03,
            ),
            child: DrawerButton(),
          ),
          SizedBox(
            width: ScreenSize.width * 0.05,
          ),
          Container(
            height: 25.0,
            width: 25.0,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/logo/logo_1.png'),
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.02,
          ),
          Text(
            "108",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.01,
          ),
          Text(
            "points",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: CartButtonForAppBar(cartData: cartData),
          ),
          SizedBox(
            width: ScreenSize.width * 0.04,
          ),
        ],
      ),
    ],
  );
}

class CartButtonForAppBar extends StatelessWidget {
  const CartButtonForAppBar({
    Key key,
    @required this.cartData,
  }) : super(key: key);

  final CartItemdata cartData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.red[200],
              child: SizedBox(
                width: 35,
                height: 35,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/logo/cart_icon.png'),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/cartPage');
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              cartData.cartItemCount.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 11.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
