//this screen is for details of train and ui
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:railway/data/firestore.dart';
import 'package:railway/data/json.dart';
import 'package:railway/data/trains.dart';
import 'package:railway/screens/book_tkt.dart';
import 'package:railway/widgets/button.dart';
import 'package:railway/widgets/text.dart';

class DetailsPage extends StatefulWidget {
  static final String id = 'details';
  final Trains train;
  @override
  DetailsPage(this.train);
  _DetailsPageState createState() => _DetailsPageState(this.train);
}

class _DetailsPageState extends State<DetailsPage> {
  //final String from, to;
  Trains _train;

  _DetailsPageState(this._train);

  DocumentSnapshot train;
  @override
  void initState() {
    super.initState();
    //setState(() {
    gettr();
    // getstname(_train.source);
    //});
    //train = await gettrainsbyId(_train);
  }

  //gettr()
  gettr() async {
    train = await gettrainsbyId(_train);
    setState(() {
      //train = await gettrainsbyId(_train);
      //print(train.data);
      print(train);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Center(
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
                Column(
                  children: [
                    SizedBox(height: 120),
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 20,
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(25),
                        width: 350,
                        height: 600,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text("${_train.trainName}"),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                  Container(
                                    width: 90,
                                    child: DottedLine(
                                      //dashLength: 10,
                                      dashRadius: 3,
                                    ),
                                  ),
                                  Icon(Icons.train),
                                  Container(
                                    width: 90,
                                    child: DottedLine(
                                      //dashLength: 10,
                                      dashRadius: 3,
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                //image
                                Text(
                                  "${_train.source}",
                                  style: TextStyle(
                                      fontFamily: 'Lato-Black', fontSize: 15),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //CustomText(_train.source),
                                //DottedLine(),
                                // Icon(Icons.train),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "${_train.destination}",
                                  style: TextStyle(
                                      fontFamily: 'Lato-Black', fontSize: 15),
                                ),
                                //CustomText(_train.destination),
                                //
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${_train.arrival}",
                                  style: TextStyle(fontFamily: 'Lato-Black'),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Text(
                                  "${_train.dept}",
                                  style: TextStyle(fontFamily: 'Lato-Black'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Text("Total Seats ",
                                        style: TextStyle(
                                            fontFamily: 'Lato-Black')),
                                    Text("${train.data['seat capacity']}",
                                        style: TextStyle(
                                            fontFamily: 'Lato-Regular'))
                                  ],
                                )),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                    child: Column(
                                  children: [
                                    Text("Booked Seats",
                                        style: TextStyle(
                                            fontFamily: 'Lato-Black')),
                                    Text("${train.data['booked']}",
                                        style:
                                            TextStyle(fontFamily: 'Lato-Black'))
                                  ],
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            CustomButton("Book Ticket", BookTicket(_train))
                          ],
                        ),
                      ),
                    ),
                    //CustomText(getcap(_train)),

                    //Text('Total Seats Available${train.data['seat capacity']}'),
                    //Text('Booked ${train.data['booked']}'),

                    //Info(),
                  ],
                ),
              ],
            ),
          )),
        ]),
      ),

      //appBar: AppBar(title: Text(""),),
    );
  }
}
/*
Widget Info()
{
  return column
                  Text('Total Seats Available${train.data['seat capacity']}'),
                  Text('Booked ${train.data['booked']}'),

}*/
