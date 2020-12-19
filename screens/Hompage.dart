import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway/data/firestore.dart';
import 'package:railway/main.dart';
import 'package:railway/screens/book_tkt.dart';
import 'package:railway/screens/cancel_tk.dart';
import 'package:railway/screens/pnr_check.dart';
import 'search_entries.dart' as hp;

class Hompage extends StatefulWidget {
  static final String id = 'Hompage';
  @override
  _HompageState createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Home Page"),
      //),
      body: Stack(children: [
        Container(
          //decoration:,
          //height: ,
          width: 500,
          //decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // colors: [
          //Colors.purple.shade100,
          // Colors.purple.shade200,
          //Colors.purple.shade400
          //]
          //  )
          //),
          child: Hero(
            tag: 'rail_tag',
            child: Center(
              child: Column(
                children: [
                  Material(
                    elevation: 20,
                    child: Container(
                      child: Image.network(
                          "https://www.metrorailnews.in/wp-content/uploads/2019/07/Sub-10K-8-1.png"),
                      color: Colors.purple,
                      height: 300,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Button("Search Train", hp.Page()),
                      SizedBox(
                        width: 50,
                      ),
                      Button("Cancel Ticket", CancelTicket()),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Button("PNR check", Pnr()),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Button extends StatelessWidget {
  //const Button({
  //Key key,
  //}) : super(key: key);
  Button(
    this.text,
    this.page,
  );
  final page;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      //borderRadius: BorderRadiusGeometry.,
      shadowColor: Colors.purple.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: FlatButton(
          minWidth: 150,
          height: 100,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontFamily: 'Lato-Black'),
          )),
    );
  }
}
