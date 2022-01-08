import 'package:flutter/material.dart';
import 'package:shrink/styles/colors.dart';

import 'components/clinic_card.dart';
import 'data/sample_data.dart';

class SelectClinic extends StatefulWidget {
  const SelectClinic({Key key}) : super(key: key);

  @override
  _SelectClinicState createState() => _SelectClinicState();
}

class _SelectClinicState extends State<SelectClinic> {
  List<Map<String, dynamic>> sampleData = getSampleData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColor_8White,
      appBar: AppBar(
        backgroundColor: globalColor_6Blue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 45,
          ),
        ),
        title: Text(
          "Select Clinic",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          for (Map<String, dynamic> i in sampleData)
            SelectClinicElement(
              data: i,
              favouritChange: (data) {},
            ),
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable


