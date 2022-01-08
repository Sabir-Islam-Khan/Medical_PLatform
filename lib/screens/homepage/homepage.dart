import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/address_provider.dart';
import 'package:shrink/provider/booking_provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/provider/favourite_product_provider.dart';
import 'package:shrink/provider/medical_feed_provider.dart';
import 'package:shrink/provider/profile_data_provider.dart';
import 'package:shrink/provider/user_provider.dart';
import 'package:shrink/screens/homepage/components/appbar_elements.dart';
import 'package:shrink/screens/homepage/components/beizer_container.dart';
import 'package:shrink/screens/homepage/components/navigation_panel.dart';
import 'package:shrink/screens/telemedicine_clinics_page/components/cart_item_data.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/screens/homepage/components/custom_menu_drawer.dart';
import 'package:shrink/screens/homepage/components/medical_feed.dart';

import 'components/booked_clinic_data.dart';

class HomePage extends StatefulWidget {
  //const NewHomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _Homescreenstate();
}

class _Homescreenstate extends State<HomePage> {
  CartItemdata cartData = CartItemdata();

  @override
  void initState() {
    super.initState();
    Provider.of<CompanyObj>(context, listen: false).updateArray(context);
    Provider.of<BookingProvider>(context, listen: false).fetchBookedClinics();
    Provider.of<UserInformation>(context, listen: false)
        .fetchDetailedUserInfo(context);
    Provider.of<AddressInformation>(context, listen: false).fetchUserAddress();
    Provider.of<FavouriteClinicProvider>(context, listen: false)
        .fetchLikedCLinics();
    Provider.of<FavouriteProductProvider>(context, listen: false)
        .fetchFavouriteProducts();
    Provider.of<MedicalPostObj>(context, listen: false).fetchFavouritePosts();
    Provider.of<ProfileDataProvider>(context, listen: false)
        .fetchDesignations();
    Provider.of<ProfileDataProvider>(context, listen: false)
        .fetchCurrencyTypes();
    Provider.of<ProfileDataProvider>(context, listen: false).fetchIdTypes();
  }

  List<DateTime> timeArray = [];

  @override
  Widget build(BuildContext context) {
    var bookedClinics = Provider.of<BookingProvider>(context).getBookings;
    String proPicURL = Provider.of<UserInformation>(context).getprofilePicURL;
    String designation = Provider.of<UserInformation>(context).getDesignation;
    String name = Provider.of<UserInformation>(context).getName;
    cartData.cartItemCount =
        Provider.of<TotalCartQty>(context).getTotalCartQty(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 111, 198, 1),
      drawer: CustomMenuDrawer(
        proPicURL: proPicURL,
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Container(
          color: Colors.white,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color.fromRGBO(0, 111, 198, 1),
                  backwardsCompatibility: false,
                  pinned: false,
                  floating: true,
                  leading: SizedBox(),
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: appbarElements(cartData),
                )
              ];
            },
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      beizerContainer(),
                      Positioned(
                        top: 20.0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: ScreenSize.width * 0.1,
                          ),
                          child: Text(
                            "Hello",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 54.0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: ScreenSize.width * 0.1,
                          ),
                          child: designation == null
                              ? SizedBox()
                              : Text(
                                  "$designation $name",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  navigationPanel(context),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 223, 237, 251),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        bookedClinics['items'] == null
                            ? SizedBox()
                            : Column(
                                children: [
                                  for (Map<String, dynamic> i
                                      in bookedClinics["items"])
                                    Column(
                                      children: [
                                        SizedBox.shrink(),
                                        bookedClinicData(context, i),
                                      ],
                                    ),
                                ],
                              ),
                        MedicalFeed(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
