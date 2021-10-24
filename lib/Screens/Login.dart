import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mywork/Screens/Home.dart';
import 'package:mywork/Screens/SignUp.dart';

class Login extends StatefulWidget {//
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email;
  String password;
  String userEmail;
  String text;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    void signUserIn()async {

      try{
      final user=  await _auth.signInWithEmailAndPassword(email: email, password: password);

        if(user!=null){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful'),));
          userEmail = _auth.currentUser.email;
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }

      }on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed, user not found'),));
          } else if (e.code == 'wrong-password') {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed check details'),));
          }
      }
    }


    return Scaffold(
      body: SafeArea(
        child: Container(
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
          width:screenWidth,
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text('Welcome back to',
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
                    Text('Enter the following details to Sign in....',
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUP()));
                          },
                          child:Container(
                            child:  Text('Don''\'t have an account?',
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
                      onTap: (){
                        signUserIn();
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
                              'Sign In',
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

