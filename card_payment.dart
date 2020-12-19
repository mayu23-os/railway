//this screen is for payment page
//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/data/trains.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railway/screens/ticketview.dart';
import 'package:railway/widgets/button.dart';
import 'package:railway/data/firestore.dart';
import 'package:railway/widgets/input.dart';
import 'package:railway/widgets/text.dart';

//final DocumentSnapshot train = gettrainsbyId(_train);

class Payment extends StatefulWidget {
  final Passenger passenger;
  final Trains train;
  Payment(this.passenger, this.train);
  @override
  _PaymentState createState() => _PaymentState(this.passenger, this.train);
}

/*
final CollectionReference bookcollectionReference =
    Firestore.instance.collection("bookings");
final CollectionReference traincollectionReference =
    Firestore.instance.collection("Trains");
*/
class _PaymentState extends State<Payment> {
  Trains _train;
  Passenger _passenger;
  DocumentSnapshot train;
  _PaymentState(this._passenger, this._train);
  TextEditingController number = new TextEditingController();

  TextEditingController auth = new TextEditingController();

  int fare;
  @override
  void initState() {
    // TODO: implement initState
    gettr();
  }

  gettr() async {
    //print("$_train");
    //print('$train');
    train = await gettrainsbyId(_train);
    setState(() {
      print(train);
    });

    // print('${train.data['fare']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          width: 500,
          height: 800,
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
                        height: 100,
                      ),
                      InputField(
                          hint: "Enter Card No",
                          controller: number,
                          obscure: false),
                      SizedBox(
                        height: 20,
                      ),
                      InputField(
                          hint: "Enter CVV", controller: auth, obscure: true),
                      //InputField(hint: , controller: null, obscure: null)
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          //Icon(Icons)
                          SizedBox(
                            width: 120,
                          ),
                          Text(
                            "Fare ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "${train.data['fare']}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ), //gettrainsbyId(_train)),
                      Material(
                        elevation: 10,
                        shadowColor: Colors.purple,
                        color: Colors.purple.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        child: FlatButton(
                            minWidth: 200,
                            color: Colors.purple.shade300,
                            onPressed: () {
                              setState(() {
                                addpassenger(
                                    _passenger, _train, number.text, null);
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TicketView(_passenger, _train)));
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Lato-Black'),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

//void check()
