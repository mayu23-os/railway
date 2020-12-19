import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway/widgets/input.dart';
import 'package:railway/data/firestore.dart';

class CancelTicket extends StatefulWidget {
  @override
  _CancelTicketState createState() => _CancelTicketState();
}

class _CancelTicketState extends State<CancelTicket> {
  TextEditingController ticketid = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 800,
        width: 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.shade100,
                Colors.purple.shade200,
                Colors.purple.shade300,
              ]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    InputField(
                        hint: "Enter TicketID",
                        controller: ticketid,
                        obscure: false),
                    SizedBox(
                      height: 50,
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: Colors.purple,
                      //  shape: RoundedRectangleBorder(
                      //    borderRadius: BorderRadius.circular(7)),
                      color: Colors.purple.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      child: FlatButton(
                          onPressed: () {
                            cancelticket(ticketid.text);
                          },
                          color: Colors.purple.shade300,
                          child: Text(
                            "Cancel Ticket",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Lato-Black'),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
