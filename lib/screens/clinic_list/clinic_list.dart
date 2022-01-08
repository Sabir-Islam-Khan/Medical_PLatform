import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shrink/styles/colors.dart';
import '../../api/clinic_data.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';
import 'package:shrink/variables/models.dart';
import 'package:geolocator/geolocator.dart';

class ClinicListPage extends StatefulWidget {
  const ClinicListPage({Key key}) : super(key: key);

  @override
  _ClinicListState createState() => _ClinicListState();
}

class _ClinicListState extends State<ClinicListPage> {
  List listArr = [];
  //int currentPage = 0;
  double latitude;
  double longitude;
  bool _isLoading = true;
  bool _isGettingLocation = true;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    extractInfo();
  }

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        _isGettingLocation = false;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  extractInfo() async {
    List tempArr = await getCompanyInfo(context);
    for (int i = 0; i < tempArr.length; i++) {
      CompanyArr companyArr = tempArr[i];
      double distanceInMeters = Geolocator.distanceBetween(
          latitude, longitude, companyArr.latitude, companyArr.longitude);
      listArr.add([
        companyArr.companyID,
        companyArr.companyName,
        webTemp + companyArr.links.logoFile,
        false,
        (distanceInMeters / 1000).toStringAsFixed(2)
      ]);
    }
    setState(() {
      _isLoading = false;
      //currentPage -= 1; //Bug here
    });
    //print(currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return ((_isLoading == false) && (_isGettingLocation == false))
        ? Scaffold(
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
            body: SizedBox(
              height: ScreenSize.height,
              child: buildList(),
            ))
        : Container(
            height: ScreenSize.height * 1,
            width: ScreenSize.width * 1,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Please Wait...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.amber,
                ),
              ],
            ),
          );
  }

  Widget buildList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: (listArr.length * 2) - 1,
        itemBuilder: (BuildContext context, int widgetIndex) {
          if (widgetIndex.isOdd) {
            return Divider(
              color: Colors.transparent,
            );
          }
          final itemIndex = widgetIndex ~/ 2;
          return _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildButton(itemIndex, listArr[itemIndex][1],
                  listArr[itemIndex][3], listArr[itemIndex][4]);
        });
  }

  Widget buildButton(int arrID, String name, bool fav, String distance) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 128,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                return Colors.white;
              }),
              padding: MaterialStateProperty.all(EdgeInsets.all(5)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ))),
          onPressed: () {
            //Navigator.of(context).pushNamed("/productPage");
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo_1.png",
                width: 61,
                height: 61,
              ),
              SizedBox(
                width: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: globalColor_1Blue,
                        ),
                        Text(
                          distance + " km",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      listArr[arrID][3] = !listArr[arrID][3];
                    });
                  },
                  icon: Icon(
                    listArr[arrID][3] ? Icons.star : Icons.star_border,
                    color: globalColor_1Blue,
                    size: 35,
                  ))
            ],
          )),
    );
  }
}
