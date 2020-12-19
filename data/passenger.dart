class Passenger {
  String name;
  String age;
  String gender;
  String paymentmode;
  int amount;
  //bool paid;
  set setname(String name) {
    this.name = name;
  }

  //Passenger();

  Passenger(this.name, this.age, this.gender, this.paymentmode);
  //this.name = "";

  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return "Passenger name -> $name age -> $age gender -> $gender mode-> $paymentmode";
  }
}
