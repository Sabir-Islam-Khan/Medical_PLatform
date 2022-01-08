import 'package:flutter/material.dart';
import 'package:shrink/api/booking_clinic.dart';
import 'package:shrink/variables/globalVar.dart';

class BookingProvider extends ChangeNotifier {
  int teleconsultId;
  bool isLoading = false;
  var bookedClinicData = {};
  toogleLoading() {
    isLoading = true;
    notifyListeners();
  }

  fetchBookedClinics() async {
    List<int> bookedClinicsId = [];
    var data = await getUserBooking();
    for (int i = 0; i < data["_meta"]["total_items"]; i++) {
      bookedClinicsId.add(data["items"][i]["company_id"]);
    }
    bookedClinicData = data;
    bookedClinicIDList = bookedClinicsId;
    notifyListeners();
  }

  get getBookings {
    return bookedClinicData;
  }

  get getLoadingStatus {
    return isLoading;
  }

  bookClinic(BuildContext context, int companyID, String notes) async {
    int id = await getTeleconsultProductID(context, companyID);
    teleconsultId = id;
    await postCompanyBooking(context, companyID, id, notes);

    notifyListeners();
  }

  deleteClinicBooking(BuildContext context) async {
    deleteBooking(context);

    notifyListeners();
  }

  get getTeleconsultId {
    return teleconsultId;
  }
}
