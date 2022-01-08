import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/medical_certificate_provider.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/screens/medical_cert_page/components/cert_card.dart';
import 'package:shrink/styles/colors.dart';

class MedicalCertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MedicalCertProvider>(context).fetchMedicalCerts();
    var certData = Provider.of<MedicalCertProvider>(context).getCertData;
    return Scaffold(
      backgroundColor: globalColor_12LightGrey,
      appBar: globalBlueAppbar(context, "Medical Certificates"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            for (Map<String, dynamic> i in certData["items"])
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.0),
                  child: CertCard(
                    data: i,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
