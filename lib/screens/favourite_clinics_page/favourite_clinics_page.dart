import 'package:flutter/material.dart';
import 'package:shrink/screens/favourite_clinics_page/components/favourite_clinic_grid.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/variables/globalVar.dart';

class FavouriteClinicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 236, 249),
      appBar: globalBlueAppbar(context, "Favourite Clinics"),
      body: Container(
        height: ScreenSize.height * 1,
        width: ScreenSize.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenSize.height * 0.02,
              ),
              Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 5.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search_outlined,
                          size: ScreenSize.height * 0.035,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: ScreenSize.height * 0.8,
                width: ScreenSize.width * 0.88,
                //  color: Colors.pink,
                child: FavouriteClinicGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
