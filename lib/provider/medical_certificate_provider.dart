import 'package:flutter/cupertino.dart';
import 'package:shrink/api/receipt_manager.dart';

class MedicalCertProvider extends ChangeNotifier {
  var certData = {
    "_links": {
      "next": null,
      "prev": null,
      "self": "/api/users/4/user_receipts?page=1&per_page=10"
    },
    "_meta": {"page": 1, "per_page": 10, "total_items": 0, "total_pages": 0},
    "items": []
  };

  fetchMedicalCerts() async {
    var certs = await getMedicalCerts();
    certData = certs;

    notifyListeners();
  }

  get getCertData {
    return certData;
  }
}
