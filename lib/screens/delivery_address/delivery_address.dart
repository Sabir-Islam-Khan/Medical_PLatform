import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/address_provider.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/variables/globalVar.dart';
import 'components/address_element.dart';
import 'components/body_widget.dart';

class DeliveryAddress extends StatelessWidget {
  final TextEditingController buildingController =
      TextEditingController(text: "");
  final TextEditingController streetController =
      TextEditingController(text: "");
  final TextEditingController unitController = TextEditingController(text: "");
  final TextEditingController cityController = TextEditingController(text: "");
  final TextEditingController stateController = TextEditingController(text: "");
  final TextEditingController countryController =
      TextEditingController(text: "");
  final TextEditingController postalcodeController =
      TextEditingController(text: "");
  final TextEditingController blockController = TextEditingController(text: "");
  final TextEditingController floorNumberController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    var sampleData =
        Provider.of<AddressInformation>(context).getUserAddressData;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: globalBlueAppbar(context, "Delivery Address"),
      body: SizedBox(
        height: ScreenSize.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      for (Map<String, dynamic> i in sampleData["items"])
                        DeliveryAddressElement(
                          data: i,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  bodyWidget(
                    buildingController,
                    streetController,
                    unitController,
                    cityController,
                    stateController,
                    countryController,
                    postalcodeController,
                    blockController,
                    floorNumberController,
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
