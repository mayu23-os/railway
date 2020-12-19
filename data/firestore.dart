/*import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore{
CollectionReference collectionReference

}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/data/trains.dart';

final CollectionReference bookcollectionReference =
    Firestore.instance.collection("bookings");
final CollectionReference traincollectionReference =
    Firestore.instance.collection("Trains");

getpassengerbyID(String id) async {
  final DocumentSnapshot doc = await bookcollectionReference.document(id).get();
  //print("in getpas");
  //print(doc.data);
  return doc;
}

gettrainsbyId(Trains train) async {
  final id = train.trainNumber;
  //print(id);
  final DocumentSnapshot traindoc =
      await traincollectionReference.document(id).get();
  //if (traindoc.exists)
  return traindoc;
  //else
  //return -1;
}

addpassenger(
    Passenger passenger, Trains train, String card, String bank) async {
  DocumentSnapshot trainToBoard = await gettrainsbyId(train);
  if (trainToBoard.data['seat capacity'] < trainToBoard['booked']) {
    bookcollectionReference.add({
      'name': passenger.name,
      'train': train.trainName,
      'train_no': train.trainNumber,
      'gender': passenger.gender,
      'age': passenger.age,
      'payment_mode': passenger.paymentmode,
      'pnr': null,
      'status': 'waiting',
      'card': card,
      'bank': bank
    }).whenComplete(() => Fluttertoast.showToast(msg: "Payment Succesfull !"));
    trainToBoard.reference.updateData({'booked': FieldValue.increment(1)});
  } else
    Fluttertoast.showToast(msg: "Train Fully booked !");
}

cancelticket(String id) async {
  DocumentSnapshot passenger = await getpassengerbyID(id);
  //print(passenger.data);
  if (passenger.data == null)
    Fluttertoast.showToast(msg: "Ticket ID does not exist");
  else
    passenger.reference.delete().whenComplete(() => Fluttertoast.showToast(
        msg:
            "Ticket is Succesfully cancelled ! Refund will be initated shortly"));
}

pnrstatus(String id) async {
  DocumentSnapshot passenger =
      await getpassengerbyID(id); //getpassengerbyID(id);
  if (passenger.data == null)
    Fluttertoast.showToast(msg: "Ticket ID does not exist");
  else {
    //print(passenger.data['PNR status']);
    return passenger.data['PNR status'];
  }
}

//getpnr
getpnr(String id) async {
  DocumentSnapshot pas;
  QuerySnapshot documents;
  documents =
      await bookcollectionReference.where("PNR", isEqualTo: id).getDocuments();
  List<DocumentSnapshot> doc = documents.documents;

  String docid;
  //for i in doc:
  for (var i = 0; i < doc.length; i++) {
    print("docid" + doc[i].documentID);
    docid = doc[i].documentID;
    //return (doc[i].documentID);
  }
  //return docid;
  pas = await getpassengerbyID(docid);
  //return pas;
  print("etpnr");
  print(pas.data);
  return pas;
}
