import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shrink/provider/address_provider.dart';
import 'package:shrink/provider/booking_provider.dart';
import 'package:shrink/provider/cart_data_provider.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/provider/display_providers.dart';
import 'package:shrink/provider/favourite_product_provider.dart';
import 'package:shrink/provider/logics_provider.dart';
import 'package:shrink/provider/medical_certificate_provider.dart';
import 'package:shrink/provider/medical_feed_provider.dart';
import 'package:shrink/provider/product_and_promo.dart';
import 'package:shrink/provider/profile_data_provider.dart';
import 'package:shrink/provider/receipt_provider.dart';
import 'package:shrink/provider/user_provider.dart';
import 'package:shrink/screens/global_component/system_bars_theme.dart';

import 'screens/cart/cart.dart';
import 'screens/credit_card_page/credit_card_page.dart';
import 'screens/delivery_address/delivery_address.dart';
import 'screens/favourites/favourites.dart';

import 'screens/insurance/insurance.dart';
import 'screens/landing_page/landing_page.dart';
import 'screens/login_page/login_page.dart';
import 'screens/product_page/product_page.dart';
import 'screens/profile_page/profile.dart';
import 'screens/receipt/receipt.dart';
import 'screens/clinic_list/clinic_list.dart';
import 'screens/select_clinic/select_clinic.dart';
import 'package:shrink/screens/payment_success/payment_success.dart';
import 'screens/registration_page/register.dart';

import 'screens/payment/payment.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(
    Phoenix(
      child: ShrinkApp(),
    ),
  );
  setSystemBarTheme();
}

class ShrinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TotalCartQty()),
        ChangeNotifierProvider.value(value: TotalCost()),
        ChangeNotifierProvider.value(value: IndexItemQty()),
        ChangeNotifierProvider.value(value: CartObj()),
        ChangeNotifierProvider.value(value: SlideUpMenuLogic()),
        ChangeNotifierProvider.value(value: UserInformation()),
        ChangeNotifierProvider.value(value: CompaniesInformation()),
        ChangeNotifierProvider.value(value: CompanyObj()),
        ChangeNotifierProvider.value(value: ProductObj()),
        ChangeNotifierProvider.value(value: PromoObj()),
        ChangeNotifierProvider.value(value: MedicalPostObj()),
        ChangeNotifierProvider.value(value: AmountDisplay()),
        ChangeNotifierProvider.value(value: DescriptionDisplay()),
        ChangeNotifierProvider.value(value: CheckBoxLogics()),
        ChangeNotifierProvider.value(value: AddressInformation()),
        ChangeNotifierProvider.value(value: BookingProvider()),
        ChangeNotifierProvider.value(value: FavouriteClinicProvider()),
        ChangeNotifierProvider.value(value: FavouriteProductProvider()),
        ChangeNotifierProvider.value(value: DeliveryFees()),
        ChangeNotifierProvider.value(value: MedicalCertProvider()),
        ChangeNotifierProvider.value(value: ReceiptProvider()),
        ChangeNotifierProvider.value(value: ProfileDataProvider()),
      ],
      child: MaterialApp(
        title: 'Shrink',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: '/landingPage',
        routes: <String, WidgetBuilder>{
          '/landingPage': (context) => LandingPage(
                status: 200,
              ),
          '/loginUser': (context) => LoginPage(),
          '/registerUser': (context) => RegisterUserPage(),
          '/productPage': (context) => ProductPage(),
          '/cartPage': (context) => CartPage(),
          '/selectClinicPage': (context) => SelectClinic(),
          '/profilePage': (context) => Profile(),
          '/deliveryAddressPage': (context) => DeliveryAddress(),
          '/paymentPage': (context) => Payment(),
          '/insurancePage': (context) => Insurance(),
          '/favouritesPage': (context) => Favourites(),
          '/historyPage': (context) => Receipt(),
          '/successPayment': (context) => SucessPaymentPage(),
          '/clinicListPage': (context) => ClinicListPage(),
          '/creditCardPage': (context) => CreditCardPage(),
        },
      ),
    );
  }
}
