import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway/data/trains.dart';
import 'package:railway/screens/card_payment.dart' as cp;
import 'bank_payment.dart' as bp;
import 'package:railway/widgets/input.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/widgets/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railway/widgets/button.dart';

//val db = Firebase.firestore;
//val db = Firebase.firestore;
//DocumentReference dr;

class BookTicket extends StatefulWidget {
  BookTicket(this.train);
  final Trains train;

  @override
  _BookTicketState createState() => _BookTicketState(this.train);
}

class _BookTicketState extends State<BookTicket> {
  _BookTicketState(this.train);
  Trains train;
  //include train details in ui
  Passenger passenger = new Passenger("", "", "", "");
  //passenger.paymentmode="";
  TextEditingController seats = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  final formKey = new GlobalKey<FormState>();
  String gender = "", mode = "";
  void initstate() {
    super.initState();
    //  gender = '';
    // mode = '';
  }

  void _saveForm() {
    var form = formKey.currentState;
//    passenger.paymentmode = "";

    if (form.validate()) {
      form.save();
      setState(() {
        //if (passenger.paymentmode = null)
        //print('null');
        // passenger.paymentmode = mode;
        //passenger.gender = gender;
        // passenger.paymentmode = mode;
        passenger = Passenger(name.text, age.text, gender, mode);
      });
    }
  }

//TextEditingController from = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Stack(children: [
          Container(
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
            //color: Colors.purple,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 10,
                      //shadowColor: ,
                      //color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10)), //BorderRadius.all(radius),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        // color: Colors.white,
                        width: 350,
                        height: 600,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            InputField(
                                hint: "Enter Name",
                                controller: name,
                                obscure: false),
                            SizedBox(
                              height: 20,
                            ),
                            InputField(
                              hint: "Enter Age",
                              controller: age,
                              obscure: false,
                            ),

                            Container(
                              width: 300,
                              height: 150,
                              padding: EdgeInsets.all(30),
                              //color: Colors.white,
                              child: DropDownFormField(
                                titleText: 'Enter Gender',
                                hintText: "Gender",
                                value: gender,
                                onSaved: (value) {
                                  setState(() {
                                    //passenger.paymentmode = value;
                                    //mode = value;
                                    gender = value;
                                    //passenger.gender = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    //passenger.gender = value;
                                    gender = value;
                                    //passenger.gender = value;
                                  });
                                },
                                dataSource: [
                                  {"display": "Female", "value": "F"},
                                  {"display": "Male", "value": "M"}
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),

                            Container(
                              width: 300,
                              //height: 200,
                              padding: EdgeInsets.all(30),
                              child: DropDownFormField(
                                //contentPadding: EdgeInsets.all(9),
                                titleText: 'Payment Mode',
                                hintText: "Payment method",
                                value: mode,
                                onSaved: (value) {
                                  setState(() {
                                    //passenger.paymentmode = value;
                                    mode = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    //passenger.paymentmode = value;
                                    mode = value;
                                  });
                                },
                                dataSource: [
                                  {"display": "Card", "value": "Card"},
                                  {
                                    "display": "Net Banking",
                                    "value": "Net Banking"
                                  }
                                  //{
                                  //"display":"Net Banking",
                                  //"value":""
                                  //}
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                            //CustomText("$fare"),
                            //CustomButton("Pay", Payment(passenger, train))
                            /*InputField(
                              hint: "Enter Total Seats",
                              controller: seats,
                              obscure: false,
                            ),*/
                            Material(
                              elevation: 10,
                              shadowColor: Colors.purple,
                              color: Colors.purple.shade300,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              child: FlatButton(
                                  minWidth: 200,
                                  onPressed: () {
                                    _saveForm();
                                    // assign();
                                    if (passenger.paymentmode == 'Card') {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    cp.Payment(
                                                        passenger, train)));
                                      });
                                    } else {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    bp.Payment(
                                                        passenger, train)));
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Pay",
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
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
