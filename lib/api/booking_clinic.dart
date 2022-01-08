import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/routes.dart';

import '../../utils/error_handlers.dart';

Future<int> getTeleconsultProductID(BuildContext context, int companyID) async {
  int consultationID;
  String consultProductURL =
      webTemp + '/api/companies/$companyID/company_consult_products';
  var response =
      await http.get(Uri.parse(consultProductURL), headers: <String, String>{
    'Authorization': 'Bearer ' + token,
  });
  if (response.statusCode == 200) {
    print("Success in getting consult id");
    ProductInfo productInfo = ProductInfo.fromJson(jsonDecode(response.body));
    ProductArr productArr = productInfo.itemArr[0];
    consultationID = productArr.productID;
  } else {
    print("Error in consult id ${response.statusCode}");
    errorDialog(context, 'Unable to get Teleconsult ID!');
  }
  return consultationID;
}

Future<void> postCompanyBooking(
  BuildContext context,
  int companyID,
  int consultationId,
  String note,
) async {
  String bookingURL = webTemp + '/api/bookings';
  //To-do: This post request needs a body, investigate futher
  var jsonData = jsonEncode({
    'product_id': consultationId,
    'note': note,
  });
  var response = await http.post(
    Uri.parse(bookingURL),
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
    body: jsonData,
  );

  if (response.statusCode == 200) {
    debugPrint('Booking Confirmed');
    Phoenix.rebirth(context);
  } else {
    print("Unable to book");
    print("response is ${response.statusCode}");
    print("${response.body}");
    //errorDialog(context, 'Unable to book consultation!');
  }
}

List timestampToDateTime(String timestamp) {
  List dataArr = [" ", " "]; //date, time
  List dateArr = []; //year, noMonth, day, hour(24hrs), minute
  List monthsArr = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List tempArr = [];

  for (int i = 0; i < (timestamp.length - 4); i++) {
    tempArr.add(timestamp[i]);
    if (timestamp[i + 1] == '-' ||
        timestamp[i + 1] == 'T' ||
        timestamp[i + 1] == ':') {
      for (int j = 1; j < tempArr.length; j++) {
        tempArr[0] += tempArr[j];
      }
      dateArr.add(tempArr[0]);
      tempArr.clear();
      i++;
    }
  }

  dataArr[0] = dateArr[2] +
      ' ' +
      monthsArr[int.parse(dateArr[1]) - 1] +
      ' ' +
      dateArr[0];
  if (int.parse(dateArr[3]) > 12) {
    dataArr[1] =
        (int.parse(dateArr[3]) - 12).toString() + '.' + dateArr[4] + 'pm';
  } else {
    dataArr[1] = dateArr[3] + '.' + dateArr[4] + 'am';
  }

  return dataArr;
}

Future<Map<String, dynamic>> getUserBooking() async {
  // print("USER ID ISSS $userID");
  Uri reqUrl = Uri.parse(webTemp + "/api/users/$userID/user_bookings");
  var response = await http.get(
    reqUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body.toString());

    return data;
  } else {
    print("Error .. ${response.statusCode}");
    return null;
  }
}

Future<int> getBookingID() async {
  Uri reqUrl = Uri.parse(webTemp + "/api/users/$userID/user_bookings");
  var response = await http.get(
    reqUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    //print("Booked company data is === \n \n $data");
    print("Success in getting booking id");
    return data["items"][0]["id"];
  } else {
    print("error in getting booking id");
    print("Status code is ${response.statusCode}");

    return -1;
  }
}

void deleteBooking(BuildContext context) async {
  int bookingId = await getBookingID();
  print("booking id is $bookingId");

  Uri reqUrl = Uri.parse(webTemp + "/api/bookings/$bookingId/cancel_booking");

  var response = await http.delete(
    reqUrl,
    headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    },
  );

  if (response.statusCode == 200) {
    print("Deleted Successfully");
    Phoenix.rebirth(context);
  } else {
    print("couldn't delete.. status code is ${response.statusCode}");
  }
}
