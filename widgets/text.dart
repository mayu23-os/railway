import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  CustomText(this.text);
  @override
  _CustomTextState createState() => _CustomTextState(this.text);
}

class _CustomTextState extends State<CustomText> {
  final String text;
  _CustomTextState(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(TextSpan(//text: "$text",
          children: <TextSpan>[
        TextSpan(
            text: "$text",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Lato-Black')),
      ])),
    );
  }
}
