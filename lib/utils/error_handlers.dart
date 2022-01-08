import 'package:flutter/material.dart';
import 'package:shrink/screens/homepage/homepage.dart';
import '../screens/landing_page/landing_page.dart';
import 'package:shrink/variables/globalVar.dart';
import '../api/cart_data.dart';

errorDialog(BuildContext context, String errorMsg) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Error!'),
            content: Text(errorMsg),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('Okay'))
                ],
              )
            ],
          ));
}

popUpDialog(BuildContext context, String title, String errorMsg) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(errorMsg),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('Okay'))
                ],
              )
            ],
          ));
}

deleteDialog(BuildContext context, int cartItemID) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('Remove Item'),
            content: Text('Remove item from cart?'),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context, 'No'),
                        child: Text('No')),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: TextButton(
                        onPressed: () => removeItemFromCart(context, cartItemID)
                                .then((result) {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .popAndPushNamed('/cartPage');
                            }),
                        child: const Text('Yes')),
                  )
                ],
              )
            ],
          ));
}

registerDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Invalid Email and/or Password'),
            content: Text('Do you want to register?'),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LandingPage(
                                      status: 200,
                                    ),
                                  ),
                                ),
                            child: Text('No')),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/registerUser')
                                    .then((result) {
                                  Navigator.of(context).pop();
                                }),
                            child: const Text('Yes')),
                      ),
                    ],
                  )
                ],
              )
            ],
          ));
}

loadingDialog(BuildContext context, String title, String errorMsg) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(errorMsg),
          ));
}

updatingDialog(
  BuildContext context,
  String title,
  String body,
) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
              child: const Text('Okay'),
            )
          ],
        )
      ],
    ),
  );
}

sessionExpiredDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Session Expired!'),
            content: Text('Your session has expired, please login again.'),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        resetButton();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LandingPage(status: 200),
                          ),
                        );
                      },
                      child: const Text('Okay'))
                ],
              )
            ],
          ));
}

resetButton() {
  token = '';
  userID = 0;
  givenName = '';
  lastName = '';
  phoneNum = '';

  cartLink = '';
  ordersLink = '';
  receiptsLink = '';
  selfLink = '';
  profilePicLink = '';

  //numProducts = 0;
  sessionID = '';
  publicKey = '';
  cartID = 0;
}
