import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/cart_data.dart';
import 'package:shrink/provider/cart_data_provider.dart';

import 'package:shrink/provider/display_providers.dart';
import 'package:shrink/screens/delivery_address/delivery_address.dart';
import 'package:shrink/screens/profile_page/profile.dart';
import 'package:shrink/variables/globalVar.dart';

Widget addToCart(
  BuildContext context,
  int productId,
  int cost,
) {
  return GestureDetector(
    onTap: () async {
      print("Tapped");
      if (hasDeliveryAddress == false) {
        print("Please add Delivery Address First");
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Error !"),
            content: Text("Please add delivery address first"),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DeliveryAddress(),
                      ),
                    ),
                    child: const Text('Okay'),
                  )
                ],
              )
            ],
          ),
        );
      } else if (hasCompletedProfile == false) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Error !"),
            content: Text("Please fillup profile first"),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    ),
                    child: const Text('Okay'),
                  )
                ],
              )
            ],
          ),
        );
      } else if (hasCompletedProfile == true && hasDeliveryAddress == true) {
        print("adding element");

        increasePath(context, productId, cost);
      }
    },
    child: Container(
      height: ScreenSize.height * 0.05,
      width: ScreenSize.width * 0.37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          "ADD TO CART",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

increasePath(BuildContext context, int productID, int cost) async {
  int _amount =
      Provider.of<AmountDisplay>(context, listen: false).getDisplayNum;
  final snackBar2 = SnackBar(
    content: Text(
      'Successfully added !',
      style: TextStyle(
        color: Colors.greenAccent,
      ),
    ),
  );

  Provider.of<TotalCartQty>(context, listen: false).incrementQty(_amount);

  await putItemToCart(context, productID, _amount);
  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
  Provider.of<TotalCost>(context, listen: false).incrementCost(
    _amount * (cost.toDouble() / 100),
  );
  Provider.of<CartObj>(context, listen: false).updateCart(context);
}

// checkout button
class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Provider.of<AmountDisplay>(context, listen: false).resetAmount();
        Navigator.pushNamed(context, '/cartPage');
      },
      child: Text(
        'CHECKOUT',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// add to cart button


