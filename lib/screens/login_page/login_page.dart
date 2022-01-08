import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shrink/api/authentication.dart';

import 'package:shrink/utils/error_handlers.dart';

import 'package:shrink/variables/globalVar.dart';

import '../splash_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Loginscreenstate createState() => _Loginscreenstate();
}

class _Loginscreenstate extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObsecured = true;
  String _errorMsg = '';

  bool isLoading = false;

  void _launchForgetPassword() async => await canLaunch(
          "https://www.shrink.sg/auth/requesting_new_password")
      ? await launch("https://www.shrink.sg/auth/requesting_new_password")
      : throw 'Could not launch  https://www.shrink.sg/auth/requesting_new_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(title: Text('Login Page')),
      body: isLoading == true
          ? splashScreen()
          : Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenSize.height * 0.7,
                    //  color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FadeAnimation(
                              0.2,
                              Row(
                                children: [
                                  Text(
                                    'Email ',
                                    style: TextStyle(
                                      color: Colors.black, //Colors.yellow[200],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          0.4,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextField(
                              controller: usernameController,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: "Enter Email here"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          0.6,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Password ',
                                    style: TextStyle(
                                      color: Colors.black, //Colors.yellow[200],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          0.8,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextField(
                              controller: passwordController,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "Enter Password here",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObsecured = !isObsecured;
                                    });
                                  },
                                  icon: Icon(
                                    isObsecured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              obscureText: isObsecured,
                              obscuringCharacter: '*',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.0,
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.transparent),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              print("forgot password tapped");
                              _launchForgetPassword();
                            }, //Missing press function (Forgot)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenSize.height * 0.3,
                    //    color: Colors.pink,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          1.2,
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                // setState(() {
                                //   // isLoading = true;
                                // });
                                if (checkEmpty() == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  errorDialog(context, _errorMsg);
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  print(
                                      "username is ++++++ ${usernameController.value.text.toString()}");
                                  print(
                                      "password is ++++++ ${passwordController.value.text.toString()}");
                                  loginUser(
                                    context,
                                    usernameController.value.text
                                        .trim()
                                        .toString(),
                                    passwordController.value.text
                                        .trim()
                                        .toString(),
                                  );
                                }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  return Colors.blue;
                                }),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        FadeAnimation(
                          1.4,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "No Account yet?",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/registerUser');
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  bool checkEmpty() {
    bool emptyFlag = false;

    if (usernameController.text.trim() == '' &&
        passwordController.text.trim() == '') {
      emptyFlag = true;
      setState(() {
        _errorMsg = 'Enter empty fields';
      });
      return emptyFlag;
    } else if (usernameController.text.trim() == '') {
      emptyFlag = true;
      setState(() {
        _errorMsg = 'Enter username';
      });
      return emptyFlag;
    } else if (passwordController.text.trim() == '') {
      emptyFlag = true;
      setState(() {
        _errorMsg = 'Enter password';
      });
      return emptyFlag;
    }

    return emptyFlag;
  }
}
