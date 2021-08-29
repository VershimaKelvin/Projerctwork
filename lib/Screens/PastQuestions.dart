import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PastQuestion extends StatefulWidget {
  @override
  _PastQuestionState createState() => _PastQuestionState();
}

class _PastQuestionState extends State<PastQuestion> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width:screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(

        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          stops: [0.0,1.0],
          colors: [

            Color(0xffB2EBF2),
            Color(0xff90CAF9),
          ],
          tileMode: TileMode.clamp
        ),
      ),
    );
  }
}
