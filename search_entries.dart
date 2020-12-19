import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:railway/screens/search.dart' as sp;
//import 'package:railway/data/search_train.dart';
//import 'search.dart' as sp;
import 'package:railway/widgets/input.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  TextEditingController from = new TextEditingController();
  TextEditingController to = new TextEditingController();
  //String _from, _to;
  //SearchTrain tline;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          //controller: controller,

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
            child: Center(
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
                          //AppBar(
                          //title: Text("Search Train"),
                          //),
                          SizedBox(
                            height: 50,
                          ),
                          InputField(
                              hint: "From", controller: from, obscure: false),
                          SizedBox(
                            height: 20,
                          ),
                          InputField(
                              hint: "To", controller: to, obscure: false),
                          SizedBox(
                            height: 20,
                            //width: ,
                          ),
                          Button2("Search", from, to)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  //const Button2({
  //Key key,
  //@required this.from,
  // @required this.to,
  //}) : super(key: key);
  Button2(
    this.text,
    this.from,
    this.to,
    // this.page,
  );
  final String text;
  // final page;

  final TextEditingController from;
  final TextEditingController to;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.purple,
      color: Colors.purple.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: FlatButton(
          onPressed: () {
            // print(from.text);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => sp.Search(from.text, to.text)));
            //NavigationRail(destinations: null, selectedIndex: null)

            //  Navigator.pushNamed(context, 'search');
          },
          colorBrightness: Brightness.light,
          // color: Colors.blue,
          minWidth: 200,
          child: Text(
            text,
            style: TextStyle(fontFamily: 'Lato-Black', fontSize: 20),
          )),
    );
  }
}

/*void _settext(controller) {
  SearchTrain line;
  if (controller == from) {
    line.from = controller.text;
  } else if(controller=="to"){
    line.to = controller.text;
  }
}*/
