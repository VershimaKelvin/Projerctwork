import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywork/Screens/Registration1.dart';
import 'package:mywork/Screens/Registration3.dart';
import 'package:mywork/Screens/Registration4.dart';
import 'package:mywork/Screens/Registration5.dart';
import 'package:mywork/Screens/Registration6.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Registration2.dart';
class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {

  int progress;
  void getIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt('counter');
    progress = intValue;
    print(progress);
  }

  void initState(){
    super.initState();
    getIntValue();
  }

  @override
  Widget build(BuildContext context) {


    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SafeArea(
        child: Container(
          width:screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0,1.0],
                colors: [

                  Color(0xffE8F5E9),
                  Color(0xffE0F7FA),
                ],
                tileMode: TileMode.clamp
            ),
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
                Card(
                  color: Color(0xffF5F5F5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: ListTile(
                    title: Text(
                      'Pay Acceptance fee',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      'You have to pay your acceptance fee, 150000 naira at CRUTECH Micro finance bank',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
