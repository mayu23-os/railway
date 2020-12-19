import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:railway/data/const.dart';
//import 'package:railway/data/list_trains.dart' as lis;
import 'dart:convert';
import 'package:railway/data/trains.dart';

import 'package:railway/screens/details.dart';
//import 'packagelib/data/search_train.dart';

class Search extends StatefulWidget {
  //final String from = ModalRoute.of(context).settings.arguments;
  // final SearchTrain line;
  static final String id = 'search';
  final String to, from; //=new SearchTrain(null, null);
  @override
  //Search(line);
  //final Todo todo;
  Search(this.from, this.to); //: super(key: key);
  // In the constructor, require a Todo.
  //DetailScreen({Key key, @required this.todo}) : super(key: key);
  _SearchState createState() => _SearchState(this.from, this.to);
}

var trains = new Trains(null, null, null, null, null, null);
List<Trains> _trainList = new List<Trains>();

class _SearchState extends State<Search> {
  //List<Trains> _trainList = new List<Trains>();
  //List<Trains> trains[100];
  //final SearchTrain line;
  String _from, _to;
  // _SearchState({Key key, @required this.line}) : super(key: key);
  _SearchState(this._from, this._to);

  List<Trains> _todisp; //= new Future<List<Trains>>>();

  // debugPrint(_trainList[9]);

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {
      buildlist(find(_from));
    });
  }

  @override
  Widget build(BuildContext context) {
    //widget.line;
    return Scaffold(
        //appBar: AppBar(
        //title: Text("Trains"),
        //),

        body: buildlist(find(_from))
        //find(_from);
        );
  }

  getData() async {
    //print(line);
    //  List<dynamic> data;
    Map<String, dynamic> map;
    List<dynamic> values;
    final response = await http
        .get("https://indianrailapi.com/api/v2/RajdhaniTrain/apikey/$apikey/");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      //List<dynamic> values = new List<dynamic>();
      //values = json.decode(response.body);
      //data = values['Trains'];
      map = json.decode(response.body);
      values = map["Trains"];
      //getlisttrains(values);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _trainList.add(Trains.fromJson(map));
            //debugPrint('Id-------${map['id']}');
            // print("trainslist in getlist$_trainList");

          }
        }
      }
      print("in for loop$_trainList");
    }
    // print(values.length);

    //return _trainList;
    else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

List<Trains> find(_from) {
  print("${_trainList.length} length");
  print("in from $_from");
  String source = _from;
  List<Trains> req = List<Trains>();
  //print(source);
  //String
  //Trains temp;

  for (var i = 0; i < _trainList.length; i++) {
    if (_trainList[i]
        .source
        .contains(new RegExp(source, caseSensitive: false))) {
      req.add(_trainList[i]);
    }
  }
  print("req $req");
  print(req.length);
  return req;
}

ListView buildlist(List<Trains> req) {
  return ListView.builder(
    itemCount: req.length,
    itemBuilder: (_, index) {
      return Listitem(req[index]);
    },
  );
}

class Listitem extends StatelessWidget {
  final Trains train;
  Listitem(this.train);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print(train);
        print("Train name ${train.trainName}");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsPage(train)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                spreadRadius: 5.0,
                color: Colors.purple.withOpacity(0.3),
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${train.trainName} (${train.trainNumber})",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'Lato-Black',
                      fontWeight: FontWeight.normal),
                ),

                //description
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        train.source,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Lato-Black'),
                      ),
                      Container(
                        width: 40,
                        child: DottedLine(
                          //dashLength: 50,
                          dashGapRadius: 2,
                          dashRadius: 9,
                        ),
                      ),
                      Icon(Icons.train_rounded),
                      Container(
                        width: 40,
                        child: DottedLine(
                          //dashLength: 50,
                          dashGapRadius: 2,
                          dashRadius: 9,
                        ),
                      ),
                      Text(
                        train.destination,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Lato-Black'),
                      )
                    ],
                  ),
                ),

                //date
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(train.dept,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Lato-Black')),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(train.arrival,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Lato-Black')),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*FutureBuilder(
  future: find(_from),
  initialData: InitialData,
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    return ;
  },
),*/
