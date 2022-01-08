import 'package:flutter/cupertino.dart';
import 'package:shrink/api/receipt_manager.dart';

class ReceiptProvider extends ChangeNotifier {
  var receiptData = {
    "_links": {
      "next": null,
      "prev": null,
      "self": "/api/users/4/user_receipts?page=1&per_page=10"
    },
    "_meta": {"page": 1, "per_page": 10, "total_items": 0, "total_pages": 0},
    "items": []
  };

  var receiptDetails = {
    "_links": {
      "next": null,
      "prev": null,
      "self": "/api/users/4/user_receipts?page=1&per_page=10"
    },
    "_meta": {"page": 1, "per_page": 10, "total_items": 0, "total_pages": 0},
    "items": []
  };

  fetchReceipt() async {
    var data = await getReceipts();

    receiptData = data;

    notifyListeners();
  }

  fetchReceiptsDetails(int id) async {
    var data = await getReceiptsDetails(id);

    receiptDetails = data;

    notifyListeners();
  }

  get getReceiptDetailsData {
    return receiptDetails;
  }

  get getReceiptData {
    return receiptData;
  }
}
