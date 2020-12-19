import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:railway/data/trains.dart';
import 'package:railway/screens/book_tkt.dart';

class CustomButton extends StatefulWidget {
  CustomButton(this.text, this.page);
  Widget page;
  Trains train;
  String text;
  @override
  _CustomButtonState createState() => _CustomButtonState(this.text, this.page);
}

class _CustomButtonState extends State<CustomButton> {
  _CustomButtonState(this.text, this.page);
  String text;
  Trains train;
  Widget page;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.purple,
      color: Colors.purple.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: FlatButton(
        minWidth: 200,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0),
        //color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Lato-Thin',
            //fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }
}
