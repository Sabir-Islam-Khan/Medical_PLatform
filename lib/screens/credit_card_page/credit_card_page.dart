import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';

import 'components/card.dart';

class CreditCardPage extends StatefulWidget {
  // const CreditCardPage({Key? key}) : super(key: key);

  @override
  _CreditCardscreenstate createState() => _CreditCardscreenstate();
}

class _CreditCardscreenstate extends State<CreditCardPage> {
  bool _checkBox = false;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final cvvController = TextEditingController();
  final expiryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Credit/Debit Card"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            card(),
            SizedBox(
              height: ScreenSize.height * 0.03,
            ),
            Container(
              width: ScreenSize.width * 0.9,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name on Card",
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.01,
            ),
            Container(
              width: ScreenSize.width * 0.9,
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Card Number",
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.01,
            ),
            Container(
              width: ScreenSize.width * 0.9,
              child: TextField(
                controller: cvvController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CVV",
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.01,
            ),
            Container(
              width: ScreenSize.width * 0.9,
              child: TextField(
                controller: expiryController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Expiry Date",
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.02,
              ),
              child: Row(
                children: [
                  Checkbox(
                      value: _checkBox,
                      onChanged: (value) {
                        setState(() {
                          _checkBox = !_checkBox;
                        });
                      }),
                  Text(
                    'I agree to the',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {}, //Missing T&C function
                    child: Text(
                      'Terms & Conditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.05,
            ),
            Container(
              height: ScreenSize.height * 0.07,
              width: ScreenSize.width * 0.85,
              child: ElevatedButton(
                onPressed: () {
                  print(nameController.value.text);
                  print(numberController.value.text);
                  print(cvvController.value.text);
                  print(expiryController.value.text);
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      return globalColor_2Blue;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ))),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
