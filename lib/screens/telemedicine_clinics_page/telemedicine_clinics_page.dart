import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/provider/user_provider.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:shrink/screens/telemedicine_clinics_page/functions/map_move.dart';
import 'package:shrink/screens/telemedicine_clinics_page/functions/markers.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:shrink/screens/telemedicine_clinics_page/components/slideup_panel.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

class TelemedicineClinicsPage extends StatefulWidget {
  const TelemedicineClinicsPage({Key key}) : super(key: key);

  @override
  _TelemedicineClinicsscreenstate createState() =>
      _TelemedicineClinicsscreenstate();
}

class _TelemedicineClinicsscreenstate extends State<TelemedicineClinicsPage>
    with TickerProviderStateMixin {
  MapController mapController = MapController();

  double _latitude;
  double _longitude;

  void initialise() async {
    // setUserDetails();
    await Future.delayed(
      Duration(milliseconds: 500),
    );
    animatedMapMove(LatLng(_latitude, _longitude), 14, this, mapController);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initialise());
  }

  @override
  Widget build(BuildContext context) {
    List companyArr = Provider.of<CompanyObj>(context).getCompanyArray;
    double totalHeight = ScreenSize.height;
    double totalWidth = ScreenSize.width;
    _latitude = Provider.of<UserInformation>(context).getLat;
    _longitude = Provider.of<UserInformation>(context).getLng;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: globalAppBar(context),
      body: SlidingUpPanel(
        maxHeight: totalHeight,
        renderPanelSheet: false,
        minHeight: ScreenSize.height * 0.58,
        parallaxEnabled: true,
        parallaxOffset: 0.6,
        panelBuilder: (homeScrollController) => buildSlidePanel(
          homeScrollController: homeScrollController,
          context: context,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: ScreenSize.height * 0.7,
              width: ScreenSize.width * 1,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  plugins: [
                    // DragMarkerPlugin(),
                  ],
                  center: LatLng(_latitude, _longitude),
                  zoom: 10.0,
                  maxZoom: 18.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: mapboxURL,
                    additionalOptions: {
                      'accessToken': mapBoxToken,
                      'id': mapBoxID
                    },
                  ),
                  MarkerLayerOptions(
                    markers: getMarkers(
                      context,
                      companyArr,
                      LatLng(_latitude, _longitude),
                      companyArr == null || companyArr.isEmpty
                          ? 0
                          : companyArr[0][10],
                      _latitude,
                      _longitude,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: ScreenSize.height * 0.49,
              child: Container(
                padding: EdgeInsets.only(
                  left: ScreenSize.width * 0.04,
                  right: ScreenSize.width * 0.04,
                ),
                width: totalWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.red[200],
                          child: SizedBox(
                            width: 46,
                            height: 46,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                  'assets/logo/center_location.png'),
                            ),
                          ),
                          onTap: () {
                            print("Tappeed");
                            animatedMapMove(LatLng(_latitude, _longitude), 14,
                                this, mapController);
                          }, //Missing Search function
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //To-do: Need to change the ClinicDetailWidget
  Widget buildSlidePanel(
      {@required ScrollController homeScrollController, BuildContext context}) {
    return SafeArea(
      child: SlideupPanel(
        scrollController: homeScrollController,
        isBooked: false,
      ),
    );
  }
}
