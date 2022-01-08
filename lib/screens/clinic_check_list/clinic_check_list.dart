import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink/provider/logics_provider.dart';

import 'package:shrink/screens/advisory_page/advisory_page.dart';
import 'package:shrink/screens/booking_page/booking_consult.dart';
import 'package:shrink/screens/clinic_check_list/components/clinic_title.dart';
import 'package:shrink/screens/global_component/blue_appbar.dart';
import 'package:shrink/variables/globalVar.dart';

class ClinicCheckList extends StatefulWidget {
  final int companyId;
  final String picUrl;
  final String name;
  ClinicCheckList(
      {@required this.companyId, @required this.picUrl, @required this.name});
  // const ClinicCheckList({ Key? key }) : super(key: key);

  @override
  _ClinicCheckListState createState() => _ClinicCheckListState();
}

class _ClinicCheckListState extends State<ClinicCheckList> {
  bool _hasFever = false;
  bool _hadHeadache = false;
  bool _hasPain = false;
  bool _hasBreathlessness = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalBlueAppbar(context, "Teleconsult"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            clinicTitle(widget.picUrl, widget.name),
            Container(
              //height: ScreenSize.height * 0.65,
              width: ScreenSize.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Are you experiencing any of the following?',
                    style: TextStyle(
                      fontSize: 22,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fever 39°C and above?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Checkbox(
                        value: Provider.of<CheckBoxLogics>(context)
                            .getTruthTable['fever'],
                        onChanged: (value) {
                          Provider.of<CheckBoxLogics>(context, listen: false)
                              .toggleIndexLogic('fever');
                          if (_hasFever == value) {
                            setState(() {
                              _hasFever = !_hasFever;
                            });
                          }
                        },
                      ),
                      Text(
                        'Yes',
                        style: TextStyle(fontSize: 16),
                      ),
                      Checkbox(
                        value: _hasFever,
                        onChanged: (value) {
                          bool status = Provider.of<CheckBoxLogics>(context,
                                  listen: false)
                              .getTruthTable["fever"];
                          setState(
                            () {
                              _hasFever = !_hasFever;
                            },
                          );

                          if (status == value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('fever');
                          }
                        },
                      ),
                      Text(
                        'No',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudden Headache?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: Container()),
                      Checkbox(
                          value: Provider.of<CheckBoxLogics>(context)
                              .getTruthTable['headache'],
                          onChanged: (value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('headache');
                            if (_hadHeadache == value) {
                              setState(() {
                                _hadHeadache = !_hadHeadache;
                              });
                            }
                          }),
                      Text(
                        'Yes',
                        style: TextStyle(fontSize: 16),
                      ),
                      Checkbox(
                        value: _hadHeadache,
                        onChanged: (value) {
                          bool status = Provider.of<CheckBoxLogics>(context,
                                  listen: false)
                              .getTruthTable['headache'];
                          setState(
                            () {
                              _hadHeadache = !_hadHeadache;
                            },
                          );

                          if (status == value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('headache');
                          }
                        },
                      ),
                      Text(
                        'No',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudden Chest Pain?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: Container()),
                      Checkbox(
                          value: Provider.of<CheckBoxLogics>(context)
                              .getTruthTable['chestpain'],
                          onChanged: (value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('chestpain');

                            if (value == _hasPain) {
                              setState(
                                () {
                                  _hasPain = !_hasPain;
                                },
                              );
                            }
                          }),
                      Text(
                        'Yes',
                        style: TextStyle(fontSize: 16),
                      ),
                      Checkbox(
                        value: _hasPain,
                        onChanged: (value) {
                          bool status = Provider.of<CheckBoxLogics>(context,
                                  listen: false)
                              .getTruthTable['chestpain'];
                          setState(
                            () {
                              _hasPain = !_hasPain;
                            },
                          );
                          if (status == value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('chestpain');
                          }
                        },
                      ),
                      Text(
                        'No',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Breathlessness?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: Container()),
                      Checkbox(
                          value: Provider.of<CheckBoxLogics>(context)
                              .getTruthTable['breathless'],
                          onChanged: (value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('breathless');

                            if (value == _hasBreathlessness) {
                              setState(() {
                                _hasBreathlessness = !_hasBreathlessness;
                              });
                            }
                          }),
                      Text(
                        'Yes',
                        style: TextStyle(fontSize: 16),
                      ),
                      Checkbox(
                        value: _hasBreathlessness,
                        onChanged: (value) {
                          bool status = Provider.of<CheckBoxLogics>(context,
                                  listen: false)
                              .getTruthTable['breathless'];
                          setState(
                            () {
                              _hasBreathlessness = !_hasBreathlessness;
                            },
                          );

                          if (status == value) {
                            Provider.of<CheckBoxLogics>(context, listen: false)
                                .toggleIndexLogic('breathless');
                          }
                        },
                      ),
                      Text(
                        'No',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: ScreenSize.height * 0.08,
                    width: ScreenSize.width * 0.85,
                    child: ElevatedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Provider.of<CheckBoxLogics>(context, listen: false)
                            .checkLogics();

                        if (Provider.of<CheckBoxLogics>(context, listen: false)
                                .getCheckFlag ==
                            false) {
                          debugPrint('Teleconsult!');
                          Provider.of<CheckBoxLogics>(context, listen: false)
                              .resetCheckLogics();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConsultPage(
                                companyID: widget.companyId,
                                name: widget.name,
                                picUrl: widget.picUrl,
                              ),
                            ),
                          );
                        } else if (Provider.of<CheckBoxLogics>(context,
                                    listen: false)
                                .getCheckFlag ==
                            true) {
                          Provider.of<CheckBoxLogics>(context, listen: false)
                              .resetCheckLogics();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdvisoryPage(
                                companyId: widget.companyId,
                                name: widget.name,
                                picUrl: widget.picUrl,
                              ),
                            ),
                          );
                          debugPrint('Go to hospital!');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
