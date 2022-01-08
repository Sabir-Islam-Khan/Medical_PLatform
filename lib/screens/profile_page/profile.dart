import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:provider/provider.dart';
import 'package:shrink/api/user_data.dart';
import 'package:shrink/provider/profile_data_provider.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/styles/colors.dart';
import 'package:shrink/variables/models.dart';
import 'package:shrink/variables/globalVar.dart';
import 'package:shrink/variables/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'functions/functions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'components/custom_fields.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile image;
  // ignore: avoid_init_to_null
  File _rotatedImage = null;
  final _picker = ImagePicker();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController givennameController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController idnumberController = TextEditingController();
  TextEditingController allergyController = TextEditingController();
  TextEditingController conditionsController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String designationValue = "";
  String idtypeValue = "";
  String currencyValue = "";
  String nationalityValue;
  String fullName = 'default';

  void requestPermission() async {
    await Permission.storage.request();
  }

  @override
  void initState() {
    super.initState();

    loadInitialValues();
    requestPermission();
  }

  List<String> designationTypes;
  List<String> currencyTypes;
  List<String> identityTypes;
  bool isLoading = true;
  loadInitialValues() async {
    DetailedUserInfo detailedUserInfo = await getDetailedUserInfo(context);

    if (detailedUserInfo.username != null) {
      usernameController =
          TextEditingController(text: detailedUserInfo.username);
    } else {
      usernameController = TextEditingController(text: "");
    }
    if (detailedUserInfo.lastName != null) {
      lastnameController =
          TextEditingController(text: detailedUserInfo.lastName);
    } else {
      lastnameController = TextEditingController(text: "");
    }

    if (detailedUserInfo.givenName != null) {
      givennameController =
          TextEditingController(text: detailedUserInfo.givenName);
    } else {
      givennameController = TextEditingController(text: "");
    }

    if (detailedUserInfo.email != null) {
      emailController = TextEditingController(text: detailedUserInfo.email);
    } else {
      emailController = TextEditingController(text: "");
    }
    if (detailedUserInfo.nationality != null) {
      nationalityController =
          TextEditingController(text: detailedUserInfo.nationality);
    } else {
      nationalityController = TextEditingController(text: "");
    }
    if (detailedUserInfo.languages != null) {
      languageController =
          TextEditingController(text: detailedUserInfo.languages);
    } else {
      languageController = TextEditingController(text: "");
    }

    if (detailedUserInfo.countryCode != null) {
      countrycodeController =
          TextEditingController(text: detailedUserInfo.countryCode);
    } else {
      countrycodeController = TextEditingController(text: "");
    }

    if (detailedUserInfo.phoneNo != null) {
      mobilenumberController =
          TextEditingController(text: detailedUserInfo.phoneNo);
    } else {
      mobilenumberController = TextEditingController(text: "");
    }

    if (detailedUserInfo.idReg != null) {
      idnumberController = TextEditingController(text: detailedUserInfo.idReg);
    } else {
      idnumberController = TextEditingController(text: "");
    }

    if (detailedUserInfo.allergies != null) {
      allergyController =
          TextEditingController(text: detailedUserInfo.allergies);
    } else {
      allergyController = TextEditingController(text: "");
    }

    if (detailedUserInfo.preExisitngCon != null) {
      conditionsController =
          TextEditingController(text: detailedUserInfo.preExisitngCon);
    } else {
      conditionsController = TextEditingController(text: "");
    }

    if (detailedUserInfo.designation != null) {
      designationValue = detailedUserInfo.designation;
    } else {
      designationValue = "Select Designation";
    }

    if (detailedUserInfo.idType != null) {
      idtypeValue = detailedUserInfo.idType;
    } else {
      idtypeValue = "Select ID Type";
    }
    if (detailedUserInfo.currency != null) {
      currencyValue = detailedUserInfo.currency;
    } else {
      currencyValue = "Select Preferred Currency";
    }
    if (detailedUserInfo.nationality != null) {
      nationalityValue = detailedUserInfo.nationality;
    } else {
      nationalityValue = "Select Nationality";
    }
    setState(() {
      isLoading = false;
    });
  }

  void updateProfilePic(BuildContext context, File file) async {
    print("put profile pic called");
    File rotatedImage = await FlutterExifRotation.rotateImage(path: file.path);
    putProfilePic(
      context,
      rotatedImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(idtypeValue + "  \n \n " + designationValue + "\n\n");

    designationTypes = Provider.of<ProfileDataProvider>(context, listen: false)
        .getDesignationValues;

    currencyTypes = Provider.of<ProfileDataProvider>(context, listen: false)
        .getCurrencyValues;

    identityTypes = Provider.of<ProfileDataProvider>(context, listen: false)
        .getIdentityValues;
    return Scaffold(
      appBar: globalBlueAppbar(
        context,
        "Profile",
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: ScreenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 95,
                height: 95,
                child: Stack(
                  children: [
                    image == null
                        ? ClipOval(
                            child: Image.network(
                              webTemp + profilePicLink,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipOval(
                            child: Image.file(
                              _rotatedImage,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () async {
                            image = await _picker.pickImage(
                              imageQuality: 20,
                              source: ImageSource.gallery,
                            );

                            if (image != null) {
                              setState(() {
                                _rotatedImage = File(image.path);
                              });
                            }
                          },
                          child: ClipOval(
                            child: Container(
                              color: globalColor_1Blue,
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text('Change Password',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  customLabel("Username"),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(usernameController, "Enter Username"),
                  SizedBox(
                    height: 10,
                  ),
                  customLabel("Designation"),
                  isLoading == true
                      ? SizedBox()
                      : DropdownButton<String>(
                          value: designationValue == ""
                              ? designationTypes[0]
                              : designationValue,
                          isExpanded: true,
                          icon: Row(
                            children: [
                              Transform.translate(
                                offset: Offset(0, -10),
                                child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey[600],
                                    size: ScreenSize.height * 0.022,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          elevation: 16,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          underline: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 1,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              // designationValue = newValue;
                            });
                          },
                          items: designationTypes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  customLabel("Last Name"),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(lastnameController, "Enter Last Name"),
                  SizedBox(
                    height: 10,
                  ),
                  customLabel("Given Name"),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(givennameController, "Enter Given Name"),
                  SizedBox(
                    height: 10,
                  ),
                  customLabel("Email"),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(emailController, "Enter Email Address"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: ScreenSize.width * 0.4,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Country Code",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: TextFormField(
                                controller: countrycodeController,
                                autofocus: false,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                decoration: InputDecoration(hintText: "+65"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mobile Number",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                                Text(
                                  " *",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            customTextField(
                              mobilenumberController,
                              "Enter Mobile Number",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customLabel("ID Type. (Government Issued)"),
                  isLoading == true
                      ? SizedBox()
                      : DropdownButton<String>(
                          value: idtypeValue == ""
                              ? identityTypes[0]
                              : idtypeValue,
                          isExpanded: true,
                          icon: Row(
                            children: [
                              Transform.translate(
                                offset: Offset(0, -10),
                                child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey[600],
                                    size: ScreenSize.height * 0.022,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          elevation: 16,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          underline: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 1,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              idtypeValue = newValue;
                            });
                          },
                          items: identityTypes.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(value),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  customLabel("Preferred Currency"),
                  isLoading == true
                      ? SizedBox()
                      : DropdownButton<String>(
                          value: currencyValue == ""
                              ? currencyTypes[0]
                              : currencyValue,
                          isExpanded: true,
                          icon: Row(
                            children: [
                              Transform.translate(
                                offset: Offset(0, -10),
                                child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey[600],
                                    size: ScreenSize.height * 0.022,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          elevation: 16,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          underline: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 1,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              currencyValue = newValue;
                            });
                          },
                          items: currencyTypes.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(value),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                  SizedBox(
                    height: 10.0,
                  ),
                  customLabel("ID No. (Government Issued)"),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(idnumberController, "Enter ID No."),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Nationality",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(nationalityController, "Enter Nationality"),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Speaks",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(languageController, "Enter Language"),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Health Declaration",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          color: globalColor_13DarkBlue),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Allergy",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(allergyController, "Enter Allergy"),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Pre-Existing Medical Condition",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  customTextField(conditionsController, "Enter Conditions"),
                  SizedBox(
                    height: ScreenSize.height * 0.03,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: ScreenSize.height * 0.07,
                        width: ScreenSize.width * 0.85,
                        child: ElevatedButton(
                          onPressed: () {
                            if (image != null) {
                              putProfilePic(
                                context,
                                File(image.path),
                              );
                            }
                            if (checkEmpty(
                                  context,
                                  allergyController,
                                  conditionsController,
                                  countrycodeController,
                                  designationValue,
                                  givennameController,
                                  idnumberController,
                                  idtypeValue,
                                  lastnameController,
                                  nationalityValue,
                                  mobilenumberController,
                                  currencyValue,
                                ) ==
                                false) {
                              updateProfile(
                                context,
                                allergyController,
                                conditionsController,
                                countrycodeController,
                                designationValue,
                                givennameController,
                                idnumberController,
                                idtypeValue,
                                lastnameController,
                                mobilenumberController,
                                emailController,
                                nationalityController,
                                languageController,
                                usernameController,
                                currencyValue,
                              );
                            }
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                return globalColor_2Blue;
                              }),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customTextField(TextEditingController txController, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      controller: txController,
      autofocus: false,
      maxLines: 1,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
      ),
    ),
  );
}
