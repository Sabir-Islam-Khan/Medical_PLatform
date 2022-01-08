import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shrink/screens/landing_page/landing_page.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/dialogue.dart';
import 'functions/functions.dart';

class RegisterUserPage extends StatefulWidget {
  RegisterUserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUserPage> {
  bool _checkBox = true;
  // final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;
  bool isObsecured = true;

  void _launchTerms() async =>
      await canLaunch("https://www.shrink.sg/use_terms")
          ? await launch("https://www.shrink.sg/use_terms")
          : throw 'Could not launch https://www.shrink.sg/use_terms';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Register')),
      body: isLoading == true
          ? Container(
              color: globalColor_13DarkBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Image.asset("assets/logo/shrink_icon_compressed.png")
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: ScreenSize.height * 0.7,
                    //  color: Colors.red,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          0.1,
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      'Email ',
                                      style: TextStyle(
                                        color:
                                            Colors.black, //Colors.yellow[200],
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
                              )),
                        ),
                        FadeAnimation(
                          0.4,
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: "Enter Email here"),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              controller: emailController,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                        SizedBox(height: 15),
                        FadeAnimation(
                          0.7,
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
                          1,
                          Container(
                            child: TextField(
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
                              controller: passController,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FadeAnimation(
                          1.3,
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenSize.width * 0.018,
                              ),
                              Checkbox(
                                value: _checkBox,
                                onChanged: (value) {
                                  setState(() {
                                    _checkBox = !_checkBox;
                                  });
                                },
                              ),
                              Text(
                                'I agree to the',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  print("terms and conditions");
                                  _launchTerms();
                                }, //Missing T&C function
                                child: Text(
                                  'Terms & Conditions',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //  color: Colors.pink,
                    height: ScreenSize.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          1.6,
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                if (checkStates(
                                      //  userController.text.trim(),
                                      emailController.text.trim(),
                                      passController.text.trim(),
                                      _checkBox,
                                      context,
                                    ) ==
                                    true) {
                                  print(
                                    "Password is ++++ ${passController.value.text.toString()}",
                                  );
                                  print(
                                    "email is ++++ ${emailController.value.text.toString()}",
                                  );
                                  registerUser(
                                    // userController.value.text.toString(),
                                    emailController.value.text
                                        .trim()
                                        .toString(),
                                    passController.value.text.trim().toString(),
                                  );
                                }
                              },
                              child: Text(
                                'REGISTER',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  return globalColor_2Blue;
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
                          height: 15,
                        ),
                        FadeAnimation(
                          1.9,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Have an account?",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/loginUser');
                                },
                                child: Text(
                                  'Log in',
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

  registerUser(String email, String password) async {
    Map data = <String, String>{
      //  "username": username,
      "email": email,
      "password": password
    };
    String jsonData = jsonEncode(data);
    var response = await http.post(registerURL, body: jsonData);
    if (response.statusCode == 201) {
      setState(() {
        isLoading = false;
      });
      // popUpDialog('Welcome to Shrink!', 'Registration Successful', context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(status: 200),
        ),
      );
    } else if (response.statusCode == 400) {
      popUpDialog(
          'user exists!', 'Please use a different email address', context);
    } else {
      setState(() {
        isLoading = false;
      });
      popUpDialog('Error!',
          'Registration failed. Please contact admin@shrink.sg', context);
    }
  }
}
