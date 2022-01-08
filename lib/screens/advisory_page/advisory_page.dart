import 'package:flutter/material.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/variables/globalVar.dart';

class AdvisoryPage extends StatelessWidget {
  // const AdvisoryPage({ Key? key }) : super(key: key);
  final int companyId;
  final String picUrl;
  final String name;

  AdvisoryPage(
      {@required this.companyId, @required this.name, @required this.picUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalBlueAppbar(context, "Advisory"),
      body: Column(
        children: [
          SizedBox(
            height: ScreenSize.height * 0.25,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Text(
              "You may have a serious underlying condition that may require urgent medical attention. \n \n Please go to a nearby clinic or hospital immediately.",
              style: TextStyle(
                fontSize: ScreenSize.height * 0.027,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
