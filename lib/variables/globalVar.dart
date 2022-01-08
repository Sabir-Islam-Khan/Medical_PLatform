library shrink.globals;

import 'package:shrink/variables/models.dart';

String autoLoginEncKey = "TEST32BITKEY...................."; // 32Bit
bool isLocationSet = false;
String token = '';
int userID = 0;
String givenName = '';
String lastName = '';
String designation = "";
String userName = "";
String phoneNum = '';
DetailedUserInfo userData;
String cartLink = '';
String ordersLink = '';
String receiptsLink = '';
String selfLink = '';
String profilePicLink = '';
double userLat;
double userLon;
List favouriteProductIdGlobal = [];
List favouriteClinicIdGlobal = [];
List promoListIdGlobal = [];
List favouritePostIdGlobal = [];
List cartSupplierNamesGlobal = [];
// int userBookedClinicId = null;
List<int> bookedClinicIDList = [];
bool hasCompletedProfile = false;
bool hasDeliveryAddress = false;
var userAddressGlobal;
// MapController mapController = MapController();
//int numProducts = 0;
String sessionID = '';
String publicKey = '';
int cartID = 0;

class ScreenSize {
  static double height;
  static double width;
}

bool startupFlag = true;
