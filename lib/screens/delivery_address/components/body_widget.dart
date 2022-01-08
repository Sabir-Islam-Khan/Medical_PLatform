import 'package:flutter/material.dart';
import 'package:shrink/api/address_manager.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/globalVar.dart';

Widget bodyWidget(
  TextEditingController buildingController,
  TextEditingController streetController,
  TextEditingController unitController,
  TextEditingController cityController,
  TextEditingController stateController,
  TextEditingController countryController,
  TextEditingController postalcodeController,
  TextEditingController blockController,
  TextEditingController floorNumberController,
  BuildContext context,
) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      customLabelText("Building"),
      SizedBox(
        height: 5,
      ),
      customTextField(buildingController, "Enter Building Name"),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 5.0,
      ),
      customLabelText("Block"),
      SizedBox(
        height: 5.0,
      ),
      customTextField(blockController, "Enter Block Number"),
      SizedBox(
        height: 10.0,
      ),
      customLabelText("Street"),
      SizedBox(
        height: 5,
      ),
      customTextField(streetController, "Enter Street"),
      SizedBox(
        height: 10.0,
      ),
      customLabelText("Floor"),
      SizedBox(
        height: 5.0,
      ),
      customTextField(floorNumberController, "Enter Floor Number"),
      SizedBox(
        height: 10,
      ),
      customLabelText("Unit"),
      SizedBox(
        height: 5,
      ),
      customTextField(unitController, "Enter Unit"),
      SizedBox(
        height: 10,
      ),
      customLabelText("City"),
      SizedBox(
        height: 5,
      ),
      customTextField(cityController, "Enter City"),
      SizedBox(
        height: 10,
      ),
      customLabelText("State"),
      SizedBox(
        height: 5,
      ),
      customTextField(stateController, "Enter State"),
      SizedBox(
        height: 10,
      ),
      customLabelText("Country"),
      SizedBox(
        height: 5,
      ),
      customTextField(countryController, "Enter Country"),
      SizedBox(
        height: 12,
      ),
      customLabelText("Postal Code"),
      SizedBox(
        height: 5,
      ),
      customTextField(postalcodeController, "Enter Postal Code"),
      SizedBox(
        height: 30.0,
      ),
      Container(
        height: ScreenSize.height * 0.08,
        width: ScreenSize.width * 0.9,
        child: ElevatedButton(
          onPressed: () {
            if (streetController.value.text == "" ||
                cityController.value.text == "" ||
                stateController.value.text == "" ||
                countryController.value.text == "" ||
                postalcodeController.value.text == "" ||
                blockController.value.text == "") {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text("Error"),
                  content: Text(
                      "Only Building, Unit and Floor Number are optional."),
                  actions: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Okay'),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              print("calling create address \n");
              createAddress(
                buildingController.value.text,
                streetController.value.text,
                unitController.value.text,
                cityController.value.text,
                stateController.value.text,
                countryController.value.text,
                postalcodeController.value.text,
                blockController.value.text,
                floorNumberController.value.text,
                context,
              );
            }
          },
          child: Text(
            'SUBMIT',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                return globalColor_2Blue;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
    ],
  );
}

Widget customTextField(TextEditingController txController, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      controller: txController,
      autofocus: false,
      maxLines: 1,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
      ),
    ),
  );
}

Widget customLabelText(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
      ],
    ),
  );
}
