import 'package:flutter/material.dart';
import 'package:shrink/variables/globalVar.dart';

Widget clinicTitleSection(String picUrl, String name) {
  return Row(
    children: [
      SizedBox(
        width: 40.0,
      ),
      Container(
        height: ScreenSize.height * 0.1,
        width: ScreenSize.width * 0.1,
        child: FittedBox(
          fit: BoxFit.cover,
          child: FadeInImage(
            placeholder: AssetImage('assets/logo/logo_1.png'),
            image: NetworkImage(
              picUrl,
            ),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/logo/logo_1.png');
            },
          ),
        ),
      ),
      SizedBox(
        width: 30.0,
      ),
      Container(
        width: ScreenSize.width * 0.5,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}
