import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/receipt_provider.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/screens/receipt/components/purchase_card.dart';
import 'package:shrink/styles/colors.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ReceiptProvider>(context, listen: false).fetchReceipt();
    var receiptData = Provider.of<ReceiptProvider>(context).getReceiptData;
    return Scaffold(
      backgroundColor: globalColor_8White,
      appBar: globalBlueAppbar(context, "Receipts"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            for (Map<String, dynamic> i in receiptData["items"])
              Center(
                child: PurchaseCard(data: i),
              ),
          ],
        ),
      ),
    );
  }
}
