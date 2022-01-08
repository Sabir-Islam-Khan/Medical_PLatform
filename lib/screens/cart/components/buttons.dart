import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _totalCartQty =
        Provider.of<TotalCartQty>(context).getTotalCartQty(context);
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
        Container(
          width: 18,
          height: 18,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            _totalCartQty.toString(),
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.red[200],
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.grey,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
