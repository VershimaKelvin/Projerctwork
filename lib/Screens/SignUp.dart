import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mywork/Screens/Home.dart';
import 'package:mywork/Screens/Login.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  bool _initialized = false;
  bool _error = false;


  FirebaseAuth _auth = FirebaseAuth.instance;

  String email;
  String password;
  String passwordfinal;
  String confirmPassword;

  // @override
  // void initState() {
  //   print("intstate has started");
  //   initializeFlutterFire();
  //   super.initState();
  // }

  somethingWentWrong(){
    print("Something went wrong");
  }

  Widget loading(){
    return Scaffold(
      body: Center(
        child:SpinKitHourGlass(
          color: Colors.blue,
          size: 50.0,
        ),

      ),
    );
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ) ,
                      Text('Create Account with',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cabin',
                          color: Color(0xff2196f3),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('MyCRUTECH!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cabin',
                          color: Color(0xff2196f3),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Enter the following details to Sign Up....',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Cabin',
                          color: Color(0xff64b5f6),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 70,
                        height: 70,
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
                          image:  AssetImage('assets/splash.png'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onChanged:(value){
                          email=value;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xff2196f3,
                              ),
                            ),
                          ),
                          labelText: 'Email',
                          labelStyle:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff64b5f6,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xff2196f3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(

                        obscureText: true,
                        onChanged:(value){
                          password=value;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xff2196f3,
                              ),
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff64b5f6,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xff2196f3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        onChanged:(value){
                          confirmPassword=value;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xff2196f3,
                              ),
                            ),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff64b5f6,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(
                                0xff2196f3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            child:Container(
                              child:  Text('Already have account?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Cabin',
                                  color: Color(0xff2196f3),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: ()async{
                          print("ontap pressed");
                          if(confirmPassword == password){

                            try{
                              await _auth.createUserWithEmailAndPassword(email: email, password: password);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            }catch(e){
                              print("This is the error");
                              print(e);
                            }


                          }else{
                            print("passwords doesnt match");
                          }

                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(
                              0xff2196f3,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              child:  Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'manrope',
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
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


