import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/booking_provider.dart';
import 'package:shrink/provider/clinic_provider.dart';
import 'package:shrink/provider/user_provider.dart';
import 'package:shrink/screens/clinic_page/components/bottom_nav_bar.dart';
import 'package:shrink/screens/global_component/app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'components/clinic_detail_widget.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';

import 'package:latlong2/latlong.dart';

class ClinicPage extends StatelessWidget {
  const ClinicPage({
    Key key,
    @required this.companyID,
    @required this.isBooked,
  }) : super(key: key);

  final int companyID;
  final bool isBooked;
  @override
  Widget build(BuildContext context) {
    // getUserBooking();
    double _latitude = Provider.of<UserInformation>(context).getLat;
    double _longitude = Provider.of<UserInformation>(context).getLng;
    double _companyLat =
        Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1][7];
    double _companyLng =
        Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1][8];
    String image =
        Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1][2];
    String name =
        Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1][1];

    bool isLoading = Provider.of<BookingProvider>(context).getLoadingStatus;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: globalAppBar(context),
      bottomNavigationBar: isLoading == true
          ? SizedBox()
          : bottomNavBar(context, companyID, image, name, isBooked),
      body: isLoading == true
          ? Container(
              height: ScreenSize.height * 1,
              width: ScreenSize.width * 1,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Stack(
              children: [
                SlidingUpPanel(
                  maxHeight: ScreenSize.height * 1,
                  renderPanelSheet: false,
                  parallaxEnabled: true,
                  minHeight: ScreenSize.height * 0.45,
                  parallaxOffset: 0.6,
                  panelBuilder: (homeScrollController) => buildSlidePanel(
                    homeScrollController: homeScrollController,
                  ),
                  body: Stack(
                    children: [
                      Container(
                        width: ScreenSize.width * 1,
                        height: isBooked == true
                            ? ScreenSize.height * 0.6
                            : ScreenSize.height * 0.85,
                        child: FlutterMap(
                          options: MapOptions(
                            zoom: 15,
                            minZoom: 10.0,
                            center: LatLng(_companyLat, _companyLng),
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
                              markers: [
                                Marker(
                                  width: 75,
                                  height: 75,
                                  point: LatLng(_latitude, _longitude),
                                  builder: (context) {
                                    return FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        "assets/gifs/user_location.gif",
                                      ),
                                    );
                                  },
                                ),
                                Marker(
                                  width: 85,
                                  height: 85,
                                  point: LatLng(_companyLat, _companyLng),
                                  builder: (context) => Container(
                                    child: Container(
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                            'assets/logo/clinic_logo.png'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildSlidePanel({
    @required ScrollController homeScrollController,
  }) {
    return SafeArea(
      child: ClinicDetailWidget(
        scrollController: homeScrollController,
        companyID: companyID,
        isBooked: this.isBooked,
      ),
    );
  }
}
