import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/clinic_provider.dart';

Map<String, dynamic> getClinicData(BuildContext context, int companyID) {
  try {
    return {
      "image": Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1]
          [2],
      "name": Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1]
          [1],
      "building":
          Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1][4],
      "address": Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1]
          [5],
      "country": Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1]
          [11],
      "postalcode":
          Provider.of<CompanyObj>(context).getCompanyArray[companyID - 1][6],
      "phone": "+65 68832883",
    };
  } catch (e) {
    // print(e);
    return null;
  }
}
