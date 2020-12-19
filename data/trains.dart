class Trains {
  String trainName;
  String trainNumber;
  String source;
  String destination;
  String dept;
  String arrival;

  Trains(String trainName, String trainNumber, String source,
      String destination, String dept, String arrival) {
    this.arrival = arrival;
    this.dept = dept;
    this.source = source;
    this.destination = destination;
    this.trainName = trainName;
    this.trainNumber = trainNumber;
  }

  // get trainName ->

  factory Trains.fromJson(Map<String, dynamic> json) {
    //debugPrint("here");
    //print(json);
    return Trains(json['TrainName'], json['TrainNumber'], json['Source'],
        json['Destination'], json['Departure'], json['Arrival']);
  }
  Map toJson() => {
        'arrival': arrival,
        'departure': dept,
        'source': source,
        'destination': destination,
        'trainname': trainName,
        'trainno': trainNumber
      };
  // Override toString to have a beautiful log of student object
  @override
  String toString() {
    return 'Train: {trainname = $trainName, trainnumber = $trainNumber,source=$source, destination=$destination , arrival=$arrival, departure=$dept}';
  }

/*void add(Trains train)
{


}*/
  /*Future<Trains> searchTrain(String sFrom) async {
    if (sFrom == source)
      return this;
    else
      return null;
  }*/
}
