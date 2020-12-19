import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railway/data/firestore.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/data/trains.dart';
import 'package:railway/screens/ticketview.dart';
import 'package:railway/widgets/input.dart';

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
  TextEditingController bankname = new TextEditingController();

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
    // print('${train.data['fare']}');
    setState(() {
      print(train);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Center(
          // child: Material(
          // elevation: 10,
          //child: Container(
          //white
          //   color: Colors.white,
          //width: 100,
          // height: 100,
          // child: Center(--------------------------------------------
          child: Container(
            // color: Colors.red,
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
                  height: 100,
                ),
                Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    // color:
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        InputField(
                            hint: "Enter Bank Name",
                            controller: bankname,
                            obscure: false),
                        InputField(
                            hint: "Enter Customer ID",
                            controller: auth,
                            obscure: false),
                        //InputField(hint: "Password", controller: auth, obscure: true),
                        //InputField(hint: , controller: null, obscure: null)
                        SizedBox(
                          height: 10,
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
                        ), //gettrainsbyId(_train)),
                        SizedBox(height: 20),
                        Material(
                          elevation: 10,
                          shadowColor: Colors.purple,
                          color: Colors.purple.shade300,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          child: FlatButton(
                              minWidth: 200,
                              //color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  addpassenger(
                                      _passenger, _train, null, bankname.text);
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
        //),
      ]),

      //),
    ));
  }
}
