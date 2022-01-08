import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/screens/telemedicine_clinics_page/components/cart_item_data.dart';

import 'package:shrink/styles/colors.dart';

// custom button for homepage cart icon

class CartButton extends StatelessWidget {
  const CartButton({
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
                width: 56,
                height: 56,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/logo/cart_icon.png'),
                ),
              ),
              onTap: () {
                Provider.of<CartObj>(context, listen: false)
                    .updateCart(context);

                Navigator.pushNamed(context, '/cartPage');
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              cartData.cartItemCount.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

// custom button for homepage drawer icon

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: globalColor_12LightGrey,
        child: InkWell(
          splashColor: Colors.red[200],
          child: SizedBox(
            width: 40,
            height: 40,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/logo/side_menu.png'),
            ),
          ),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}
