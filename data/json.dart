import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:railway/data/const.dart';

getstname(String stationName) async {
  Map<String, dynamic> map;
  List<dynamic> value;
  final response = await http.get(
      "http://indianrailapi.com/api/v2/StationNameToCode/apikey/$apikey/StationName/$stationName/");

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    //List<dynamic> values = new List<dynamic>();
    //values = json.decode(response.body);
    //data = values['Trains'];
    map = json.decode(response.body);
    value = map["Station"];
    print(value);
  }
}
