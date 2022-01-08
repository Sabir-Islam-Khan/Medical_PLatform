import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void animatedMapMove(LatLng destLocation, double destZoom,
    TickerProvider vsyncRef, MapController mapController) {
  final _latTween = Tween<double>(
      begin: mapController.center.latitude, end: destLocation.latitude);
  final _lngTween = Tween<double>(
      begin: mapController.center.longitude, end: destLocation.longitude);
  final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);
  var controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: vsyncRef);
  Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
  controller.addListener(() {
    mapController.move(
        LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
        _zoomTween.evaluate(animation));
  });

  animation.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      controller.dispose();
    } else if (status == AnimationStatus.dismissed) {
      controller.dispose();
    }
  });
  controller.forward();
}
