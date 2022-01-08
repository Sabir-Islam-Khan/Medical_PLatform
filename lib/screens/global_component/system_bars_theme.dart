import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

setSystemBarTheme() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromRGBO(242, 242, 242, 1),
      systemNavigationBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ),
  );
}
