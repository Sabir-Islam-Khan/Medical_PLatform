import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';

import 'components/insurance_card.dart';
import 'data/sample_data.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key key}) : super(key: key);

  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  List<Map<String, dynamic>> sampleData = getSampleData();

  final companyController = TextEditingController();
  final typeController = TextEditingController();
  final policyController = TextEditingController();
  final expiryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalColor_6Blue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Insurance",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (Map<String, dynamic> i in sampleData)
                    InsuranceElement(
                      data: i,
                    ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            customLabel("Insurance Company"),
            SizedBox(
              height: 5,
            ),
            customTextField(companyController, "Enter Company Name"),

            SizedBox(
              height: 15.0,
            ),
            // insurance type field

            customLabel("Insurance Type"),
            SizedBox(
              height: 5,
            ),
            customTextField(typeController, "Enter Insurance Type"),

            SizedBox(
              height: 10.0,
            ),
            // policy number field
            customLabel("Policy Number"),
            SizedBox(
              height: 5,
            ),
            customTextField(policyController, "Enter Policy Number"),

            SizedBox(
              height: 15.0,
            ),
            // expiry date field
            customLabel("Expiry Date"),
            SizedBox(
              height: 5,
            ),
            customTextField(expiryController, "Enter Expiry Controller"),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: ScreenSize.height * 0.07,
                    width: ScreenSize.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/addinsurancePage");
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            return globalColor_2Blue;
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customTextField(TextEditingController txController, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      controller: txController,
      autofocus: false,
      maxLines: 1,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
      ),
    ),
  );
}

Widget customLabel(String label) {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            // fontWeight: FontWeight.normal,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}
