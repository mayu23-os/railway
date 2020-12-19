import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    @required this.hint,
    // this.hint=
    Key key,
    @required this.controller,
    @required this.obscure,
    //@required this.text
  }) : super(key: key);

  /*void _setText() { 
    setState(() { 
      text= titleController.text; 
    }); 3
  }*/
  //final SearchTrain line;
  //final String text;
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    var container = Container(
      // color: Colors.blue,
      // alignment: ,
      width: 200,
      height: 60,
      /*decoration: BoxDecoration(
        //boxShadow: [
        // box
        // ],
        //shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            spreadRadius: 1.0,
            color: Colors.grey.withOpacity(0.1),
            //offset: Offset(0, 3),
          ),
        ],
        border: Border(
            bottom: BorderSide(
                color: Colors.grey.shade300, style: BorderStyle.none)),
        // borderRadius: BorderRadius.circular(10),
        // color: Colors.blue,
      ),*/
      padding: EdgeInsets.all(10),

      child: Material(
        elevation: 18.0,
        shadowColor: Colors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        //child: Container(
        //width: 100,

        child: TextField(
          style: TextStyle(
                            color: Colors.black, fontFamily: 'Lato-Black'),
          // selectionWidthStyle: BoxWidthStyle.max,
          controller: controller,
          obscureText: obscure,
          // textDirection: TextDirection.ltr,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            hintText: '$hint',
            hintStyle: TextStyle(fontFamily: 'Lato-Black'),
          ),
          //onChanged: (value) => controller.text = value,
        ),
      ),

      //),
    );
    return container;
  }
}
