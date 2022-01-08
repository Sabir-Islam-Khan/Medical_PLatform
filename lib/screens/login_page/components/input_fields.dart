import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:shrink/variables/globalVar.dart';

Widget inputFields(
  TextEditingController mailController,
  TextEditingController passwordController,
) {
  return Container(
    height: ScreenSize.height * 0.7,
    //  color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: 20,
        // ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: mailController,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: "Enter Email here"),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FadeAnimation(
          0.6,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Enter Password here"),
              obscureText: true,
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
            style: TextButton.styleFrom(primary: Colors.transparent),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            onPressed: () {}, //Missing press function (Forgot)
          ),
        ),
      ],
    ),
  );
}
