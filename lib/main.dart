import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mywork/Screens/Home.dart';
import 'package:mywork/Screens/Login.dart';
import 'Screens/PastQuestions.dart';
import 'Screens/SignUp.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("flutterfire initialise finished");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
  }


