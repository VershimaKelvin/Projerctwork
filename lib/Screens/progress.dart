import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  int progress;
  void getIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt('counter');
    if (mounted) {
      setState(() {
        progress = intValue;
      });
    }
    print(progress);
  }

  void initState() {
    getIntValue();
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
                  'Here are the items you have completed.',
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
                  subTitle: 'Pay acceptance fee',
                  widgetStep: 1,
                  userCurrentStep: progress ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 2',
                  subTitle: 'bla bla bla',
                  widgetStep: 2,
                  userCurrentStep: progress ?? 0,
                ),
                ProgressWidget(
                  title: 'Step 3',
                  subTitle: 'bla bla bla',
                  widgetStep: 3,
                  userCurrentStep: progress ?? 0,
                ),
                //TODO (@VershimaKelvin): continue like this till you reach the final level, also ensure to change the title and sub-title
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
              ? Colors.yellow[100]
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
