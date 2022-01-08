import 'package:flutter/material.dart';
import 'package:shrink/api/authentication.dart';
import 'package:shrink/screens/medical_cert_page/medical_cert_page.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/models.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({
    Key key,
    @required this.proPicURL,

    // @required this.languages,
  }) : super(key: key);

  final String proPicURL;

  // final String languages;

  void fetchLanguage(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    DetailedUserInfo data = userData;
    String language = data.languages;
    String username = data.username;
    return Drawer(
      child: Container(
        color: globalColor_20WineRed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(webTemp + profilePicLink),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      username == null
                          ? Text(
                              "No name",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Text(
                              // "Place Holder",
                              username,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: ScreenSize.width * 0.7,
                    color: Color.fromRGBO(148, 107, 120, 1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 24,
                    top: 5,
                    bottom: 5,
                    left: 24,
                  ),
                  child: language == null
                      ? Text(
                          "No data provided",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      : Text(
                          "Speaks " + language,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: ScreenSize.width * 0.7,
                    color: Color.fromRGBO(148, 107, 120, 1),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/profilePage");
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Delivery Address',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .pushNamed("/deliveryAddressPage");
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Favourites',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/favouritesPage");
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Receipt',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed("/historyPage");
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Medical Cert',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MedicalCertPage(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          resetButton();
                          deleteToken(context);
                          Navigator.pushReplacementNamed(context, '/loginUser');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
