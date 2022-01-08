// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/booking_provider.dart';
import 'package:shrink/screens/booking_page/components/title_section.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/styles/colors.dart';

import 'package:shrink/variables/globalVar.dart';

class BookingConsultPage extends StatelessWidget {
  //const BookingConsultPage({ Key? key }) : super(key: key);
  final String picUrl;
  final String name;
  final int companyID;

  BookingConsultPage(
      {@required this.picUrl, @required this.name, @required this.companyID});
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<BookingProvider>(context).getLoadingStatus;
    return Scaffold(
      appBar: globalBlueAppbar(context, "Booking"),
      body: isLoading == true
          ? Container(
              height: ScreenSize.height * 1,
              width: ScreenSize.width * 1,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ScreenSize.height * 0.03,
                      ),
                      clinicTitleSection(picUrl, name),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            'Teleconsult',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " *",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Notes (optional)',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          controller: notesController,
                          autofocus: false,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          decoration: InputDecoration(hintText: " Type here"),
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.height * 0.1,
                      ),
                      Center(
                        child: SizedBox(
                          height: ScreenSize.height * 0.08,
                          width: ScreenSize.width * 0.9,
                          child: ElevatedButton(
                            onPressed: () async {
                              Provider.of<BookingProvider>(context,
                                      listen: false)
                                  .toogleLoading();
                              print("notes are ${notesController.value.text}");

                              print(
                                  "company id is .... \n \n $companyID \n \n");

                              Provider.of<BookingProvider>(context,
                                      listen: false)
                                  .bookClinic(context, companyID,
                                      notesController.value.text);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                return globalColor_2Blue;
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            child: Text(
                              'Book',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
