import 'package:flutter/material.dart';
import 'package:shrink/screens/product_homepage/product_homepage.dart';
import 'package:shrink/screens/telemedicine_clinics_page/telemedicine_clinics_page.dart';
import 'package:shrink/variables/globalVar.dart';

Widget navigationPanel(BuildContext context) {
  return Container(
    width: ScreenSize.width * 1,
    height: ScreenSize.height * 0.2,
    child: Row(
      children: [
        Container(
          height: ScreenSize.height * 0.2,
          width: ScreenSize.width * 0.5,
          color: Color.fromARGB(255, 99, 134, 178),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenSize.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelemedicineClinicsPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 75.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/logo/teleconsult_logo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                ),
                child: Text(
                  "Teleconsult GP",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                ),
                child: Text(
                  "Doctor",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: ScreenSize.height * 0.2,
          width: ScreenSize.width * 0.5,
          color: Color.fromARGB(255, 70, 96, 126),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenSize.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductHomepage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 75,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/logo/marketplace_icon.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                ),
                child: Text(
                  "Shop at",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                ),
                child: Text(
                  "Marketplace",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
