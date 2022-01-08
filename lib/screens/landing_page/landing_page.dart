import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/authentication.dart';
import 'package:shrink/provider/user_provider.dart';

import 'package:shrink/screens/registration_page/register.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:encrypt/encrypt.dart' as encrypt;

import '../splash_screen.dart';

class LandingPage extends StatefulWidget {
  //const LandingPage({Key key}) : super(key: key);
  final int status;
  LandingPage({@required this.status});
  @override
  _Landingscreenstate createState() => _Landingscreenstate();
}

class _Landingscreenstate extends State<LandingPage> {
  // void checkBookingStatus() async {
  //   int id = await getUserBooking();
  //   userBookedClinicId = id;
  // }

  @override
  void initState() {
    super.initState();
    // checkBookingStatus();
    getCurrentLocation();
    //LocationHandler().update();
    debugPrint("in landingPage initState");
    print("api called at ${DateTime.now()}");
    if (widget.status == 200) {
      SharedPreferences.getInstance().then(
        (prefs) {
          if (prefs.containsKey("isLogged")) {
            if (prefs.getBool("isLogged")) {
              setState(() {
                isReturningUser = true;
              });
              debugPrint("trying login....");
              String encryptedUsername = prefs.getString("data1");
              String encryptedPassword = prefs.getString("data2");
              final key = encrypt.Key.fromUtf8(autoLoginEncKey);
              final iv = encrypt.IV.fromLength(16);
              final encrypter = encrypt.Encrypter(encrypt.AES(key));

              loginUser(context, encrypter.decrypt64(encryptedUsername, iv: iv),
                  encrypter.decrypt64(encryptedPassword, iv: iv));

              Provider.of<UserInformation>(context, listen: false)
                  .updateCurrentLocation();

              print("api call ends ${DateTime.now()}");
            }
          }
        },
      );
    }
  }

  getCurrentLocation() async {
    debugPrint("called");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userLat = position.latitude;
    userLon = position.longitude;
    debugPrint("getloc setstate ${position.latitude}");
  }

  bool isLoading = false;
  bool isReturningUser = false;
  @override
  Widget build(BuildContext context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;
    return isLoading == true
        ? splashScreen()
        : isReturningUser == true
            ? splashScreen()
            : Scaffold(
                body: SizedBox(
                  width: ScreenSize.width,
                  child: Column(
                    children: [
                      Container(
                        height: ScreenSize.height * 0.7,
                        // color: Colors.red,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            SizedBox(
                              height: ScreenSize.height * 0.3,
                            ),
                            FadeAnimation(
                              1,
                              Container(
                                height: 100,
                                width: ScreenSize.width * 1,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    "assets/logo/shrink_icon_compressed.png",
                                    // width: ScreenSize.width * 1,
                                    // height: ScreenSize.height * 0.1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenSize.height * 0.3,
                        // color: Colors.pink,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeAnimation(
                              1.5,
                              SizedBox(
                                height: 60,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterUserPage(),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (states) {
                                          return globalColor_2Blue;
                                        },
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ))),
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              1.8,
                              SizedBox(
                                height: 60,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Provider.of<UserInformation>(context,
                                            listen: false)
                                        .updateCurrentLocation();
                                    Navigator.pushNamed(context, '/loginUser');
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (states) {
                                          return Colors.white;
                                        },
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: globalColor_2Blue),
                                      ))),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 20, color: globalColor_2Blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: ScreenSize.height * 0.09,
                      // ),
                    ],
                  ),
                ),
              );
  }
}
