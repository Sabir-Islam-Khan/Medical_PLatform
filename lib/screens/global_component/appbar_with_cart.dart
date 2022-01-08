import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/provider/display_providers.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget appbarWithCart(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
      backgroundColor: globalColor_12LightGrey,
      leading: Container(),
      elevation: 0.00,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenSize.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenSize.width * 0.03,
              ),
              BackArrowButton(),
              Expanded(
                child: SizedBox(),
              ),
              CartWithNum(),
              SizedBox(
                width: ScreenSize.width * 0.04,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    Key key,
  }) : super(key: key);

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
            Provider.of<AmountDisplay>(context, listen: false).resetAmount();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class CartWithNum extends StatelessWidget {
  const CartWithNum({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _totalItems =
        Provider.of<TotalCartQty>(context).getTotalCartQty(context);
    return Stack(
      children: [
        ClipOval(
          child: Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.red[200],
              child: SizedBox(
                width: 40,
                height: 40,
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
              color: Colors.red[200], borderRadius: BorderRadius.circular(9)),
          child: Text(
            _totalItems.toString(),
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
