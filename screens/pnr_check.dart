import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:railway/data/firestore.dart' as f;
import 'package:railway/widgets/button.dart';
import 'package:railway/widgets/input.dart';
import 'Hompage.dart';

class Pnr extends StatefulWidget {
  @override
  _PnrState createState() => _PnrState();
}

class _PnrState extends State<Pnr> {
  TextEditingController ticketid = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                  height: 200,
                ),
                Material(
                  elevation: 10,
                  shadowColor: Colors.purple,
                  color: Colors.purple.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
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
                            hint: "Enter PNR Number",
                            controller: ticketid,
                            obscure: false),
                        SizedBox(
                          height: 50,
                        ),
                        Material(
                          elevation: 10,
                          shadowColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          color: Colors.purple.shade300,
                          child: FlatButton(
                            minWidth: 180,
                            onPressed: () {
                              //f.getpnr("1000000002");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Pnrpage(ticketid.text)));
                            },
                            color: Colors.purple.shade300,
                            child: Text("Check status",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato-Black')),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pnrpage extends StatefulWidget {
  Pnrpage(this.id);
  final String id;
  @override
  _PnrpageState createState() => _PnrpageState(this.id);
}

class _PnrpageState extends State<Pnrpage> {
  String id;
  String status;
  DocumentSnapshot passenger;
  _PnrpageState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpnr();
  }

  DocumentSnapshot doc;
  bool confirmed = false;
  var color;
  getpnr() async {
    // passenger = await f.getpassengerbyID(id);
    // status = await f.pnrstatus(id);
    doc = await f.getpnr(id);
    setState(() {
      print("doc.data");
      print(doc.data);
      // print("status " + status);
      //print("ps ${passenger.data}");
      if (doc.data['PNR status'] == "confirmed") {
        confirmed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
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
                      width: 300,
                      height: 500,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Passenger Details",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 30),
                          Text(""),
                          Text("Train : ${doc.data['train']}"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Name : ${doc.data['name']}"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Age : ${doc.data['age']}"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("PNR number : ${doc.data['PNR']}"),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Status : ${doc.data['PNR status']}",
                              style: TextStyle(
                                  color:
                                      confirmed ? Colors.green : Colors.red)),
                          SizedBox(
                            height: 20,
                          ),
                          // CustomButton("HomePage", Navigator.pop(context))
                          FloatingActionButton(
                              backgroundColor: Colors.purple,
                              child: Icon(Icons.home),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hompage()));
                              })
                        ],
                      )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
