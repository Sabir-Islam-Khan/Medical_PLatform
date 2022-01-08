import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:shrink/variables/globalVar.dart';

Widget beizerContainer() {
  return ClipPath(
    clipper: ProsteBezierCurve(
      position: ClipPosition.bottom,
      list: [
        BezierCurveSection(
          start: Offset(0, 130),
          top: Offset(ScreenSize.width / 4, 150),
          end: Offset(ScreenSize.width / 2, 125),
        ),
        BezierCurveSection(
          start: Offset(ScreenSize.width / 3, 125),
          top: Offset(ScreenSize.width / 4 * 3, 100),
          end: Offset(ScreenSize.width, 140),
        ),
      ],
    ),
    child: Container(
      height: 150.0,
      color: Color.fromRGBO(0, 111, 198, 1),
    ),
  );
}
