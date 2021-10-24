import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywork/Screens/Login.dart';
import 'package:mywork/Screens/Registration1.dart';
import 'package:mywork/Screens/Registration2.dart';
import 'package:mywork/Screens/Registration3.dart';
import 'package:mywork/Screens/Registration4.dart';
import 'package:mywork/Screens/Registration5.dart';
import 'package:mywork/Screens/Registration6.dart';
import 'package:mywork/Screens/clearanceprogress.dart';
import 'package:mywork/Screens/progress.dart';
import 'package:mywork/clearance/clearance1.dart';
import 'package:mywork/clearance/clearance2.dart';
import 'package:mywork/clearance/clearance3.dart';
import 'package:mywork/clearance/clearance4.dart';
import 'package:mywork/clearance/clearance5.dart';
import 'package:mywork/clearance/clearance6.dart';
import 'package:mywork/clearance/clearance7.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data;
  String userEmail;
  FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic user;

  // ignore: must_call_super
  void initState() {
    userEmail = _auth.currentUser.email;
  }

  void setIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter',0);

    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    prefs.setInt('counter2',0);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'MyCrutech',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Cabin',
              color: Color(0xffE0F7FA),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top:13.0,right: 13),
            child: GestureDetector(
              onTap: () async {
                await _auth.signOut();
                setIntValue();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));

              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Cabin',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Colors.white,
                      ),
                      child: Image(
                        image: AssetImage('assets/splash.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hi $userEmail',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 160,
                            child: Text(
                              'Here is a list of items you need to check... ',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Cabin',
                                color: Color(0xff64b5f6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Widget widget = Registration1();
                        final prefs = await SharedPreferences.getInstance();
                        int intValue = prefs.getInt('counter');
                        switch (intValue) {
                          case 1:
                            widget = Registration2();
                            break;
                          case 2:
                            widget = Registration3();
                            break;
                          case 3:
                            widget = Registration4();
                            break;
                          case 4:
                            widget = Registration5();
                            break;
                          case 5:
                            widget = Registration6();
                            break;

                          default:
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => widget,
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: Color(0xffCFD8DC),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Image(
                            image: AssetImage('assets/reg1.png'),
                          ),
                          title: Text(
                            'Start Registration',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cabin',
                              color: Colors.blue,
                            ),
                          ),
                          subtitle: Text(
                            'Get directions to registration offices and required documents',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Cabin',
                              color: Color(0xff424242),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Progress()));
                      },
                      child: Container(
                        height: 80,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: Color(0xffCFD8DC),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            child: Image(
                              image: AssetImage('assets/book.png'),
                            ),
                          ),
                          title: Text(
                            'View Registration Progress',
                            style: TextStyle(
                              fontSize:18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cabin',
                              color: Colors.blue,
                            ),
                          ),
                          subtitle: Text(
                            'See how far you have gone with your registration ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Cabin',
                              color: Color(0xff424242),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Widget widget = Clearance1();
                        final prefs2 = await SharedPreferences.getInstance();
                        int intValue2 = prefs2.getInt('counter2');
                        switch (intValue2) {
                          case 1:
                            widget = Clearance2();
                            break;
                          case 2:
                            widget = Clearance3();
                            break;
                          case 3:
                            widget = Clearance4();
                            break;
                          case 4:
                            widget =Clearance5();
                            break;
                          case 5:
                            widget = Clearance6();
                            break;
                          case 6:
                            widget = Clearance7();
                            break;

                          default:
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => widget,
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: Color(0xffCFD8DC),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Image(
                            image: AssetImage('assets/reg1.png'),
                          ),
                          title: Text(
                            'Start Clearance',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cabin',
                              color: Colors.blue,
                            ),
                          ),
                          subtitle: Text(
                            'Get directions to registration offices and required documents',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Cabin',
                              color: Color(0xff424242),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClearanceProgress()));
                      },
                      child: Container(
                        height: 80,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: Color(0xffCFD8DC),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            child: Image(
                              image: AssetImage('assets/book.png'),
                            ),
                          ),
                          title: Text(
                            'View Clearance Progress',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cabin',
                              color: Colors.blue,
                            ),
                          ),
                          subtitle: Text(
                            'See how far you have gone with your Clearance ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Cabin',
                              color: Color(0xff424242),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
