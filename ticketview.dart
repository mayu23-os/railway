import 'package:flutter/material.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/data/trains.dart';
import 'package:fw_ticket/fw_ticket.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:railway/screens/Hompage.dart';

class TicketView extends StatefulWidget {
  Passenger passenger;
  Trains train;
  TicketView(this.passenger, this.train);
  @override
  _TicketViewState createState() =>
      _TicketViewState(this.passenger, this.train);
}

class _TicketViewState extends State<TicketView> {
  Passenger passenger;
  Trains train;
  _TicketViewState(this.passenger, this.train);
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
            SizedBox(height: 100),
            Ticket(
              dashedBottom: true,
              innerRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              outerRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4.0),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  color: Colors.grey.shade100, //fromRGBO(196, 196, 196, .76),
                ),
              ],
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Text("Train : ${train.trainName}"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Source : ${train.source}"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Destination : ${train.destination}"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Departure : ${train.dept}"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Arrival : ${train.arrival}"),
                    //Text
                  ],
                ),
                height: 300,
                width: 300,
              ),
            ),
            Ticket(
              innerRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              outerRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  color: Colors.grey.shade300,
                )
              ],
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Name : ${passenger.name}"),
                      ],
                    ),
                    SizedBox(
                      //width: 40,
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("Age : ${passenger.age}"),
                        SizedBox(
                          width: 40,
                        ),
                        Text("Gender : ${passenger.gender}")
                        //Padding(padding: EdgeInsetsGeometry.lerp(a, b, t))
                      ],
                    ),
                    SizedBox(
                      //width: 40,
                      height: 20,
                    ),
                    Text("Payment Mode : ${passenger.paymentmode}"),
                  ],
                ),
                height: 200,
                width: 300,
              ),
            )
            /* Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3))),
              child: Text("${passenger.name}"),
            )*/
            ,
            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
                backgroundColor: Colors.purple,
                child: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hompage()));
                })
          ],
        ),
      ),
    )));
  }
}
