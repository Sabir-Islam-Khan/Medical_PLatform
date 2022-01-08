import 'package:flutter/material.dart';
import 'package:shrink/screens/favourites/favourites.dart';
import 'package:shrink/screens/homepage/homepage.dart';

import 'package:shrink/variables/globalVar.dart';

Widget globalBlueAppbar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
      backgroundColor: Color.fromRGBO(0, 111, 198, 1),
      centerTitle: true,
      leading: SizedBox(),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ScreenSize.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize.width * 0.03,
                ),
                child: IconButton(
                  onPressed: () {
                    if (title == "Favourite Clinics") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Favourites(),
                        ),
                        (route) => false,
                      );
                    } else if (title == "Favourite Products") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Favourites(),
                        ),
                        (route) => false,
                      );
                    } else if (title == "Favourites") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    } else if (title == "Profile") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    } else if (title == "Delivery Address") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    } else if (title == "Receipts") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    } else if (title == "Medical Certificates") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(),
              SizedBox(),
            ],
          ),
        ],
      ),
    ),
  );
}
