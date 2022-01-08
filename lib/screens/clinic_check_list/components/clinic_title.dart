import 'package:flutter/material.dart';
import 'package:shrink/variables/globalVar.dart';

Widget clinicTitle(String picUrl, String name) {
  return Row(
    children: [
      SizedBox(
        width: ScreenSize.width * 0.1,
      ),
      Container(
        height: ScreenSize.height * 0.1,
        width: ScreenSize.width * 0.1,
        child: FittedBox(
          fit: BoxFit.cover,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/logo_1.png'),
            image: NetworkImage(
              picUrl,
            ),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/logo_1.png');
            },
          ),
        ),
      ),
      SizedBox(
        width: ScreenSize.width * 0.1,
      ),
      Container(
        width: ScreenSize.width * 0.55,
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
