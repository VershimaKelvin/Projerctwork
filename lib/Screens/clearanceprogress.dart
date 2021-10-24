import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClearanceProgress extends StatefulWidget {
  @override
  _ClearanceProgressState createState() => _ClearanceProgressState();
}

class _ClearanceProgressState extends State<ClearanceProgress> {
  int progress2;
  void getIntValue2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue2 = prefs.getInt('counter2');
    if (mounted) {
      setState(() {
        progress2 = intValue2;
      });
    }
    print(progress2);
  }

  void initState() {
    getIntValue2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  Color(0xffE8F5E9),
                  Color(0xffE0F7FA),
                ],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  'Here are the items you have completed for your Clearance.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cabin',
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ProgressWidget(
                  title: 'Step 1',
                  subTitle: 'Faculty clearance',
                  widgetStep: 1,
                  userCurrentStep: progress2 ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 2',
                  subTitle: 'Departmental Clearance',
                  widgetStep: 2,
                  userCurrentStep: progress2 ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 3',
                  subTitle: 'Library Clearance',
                  widgetStep: 3,
                  userCurrentStep: progress2 ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 4',
                  subTitle: 'Store Clearance',
                  widgetStep: 4,
                  userCurrentStep: progress2 ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 5',
                  subTitle: 'Hostel and sport and Clearance',
                  widgetStep: 5,
                  userCurrentStep: progress2 ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 6',
                  subTitle: 'Security Clearance',
                  widgetStep: 6,
                  userCurrentStep: progress2 ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 7',
                  subTitle: 'Medical Clearance',
                  widgetStep: 7,
                  userCurrentStep: progress2 ?? 0,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.widgetStep,
    @required this.userCurrentStep,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final int widgetStep;
  final int userCurrentStep;

  @override
  Widget build(BuildContext context) {
    log('userCurrentStep : $userCurrentStep and widgetStep $widgetStep');
    return Card(
      color: widgetStep == userCurrentStep
          ? Colors.green[300]
          : userCurrentStep < widgetStep
          ? Color(0xff9e9e9e)
          : Colors.green[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cabin',
            color: Colors.blue,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: 'Cabin',
            color: Color(0xff424242),
          ),
        ),
      ),
    );
  }
}