import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String name;
  Timestamp date;
  int quantity;
  bool subsOk;
  List substitutions;
  String addedBy;
  Timestamp lastUpdated;
  bool private;
  bool urgent;
  bool isCrossedOff;
  Map listPositions;

  Item(DocumentSnapshot document) {
    this.id = document['id'];
    this.name = document['name'];
    this.date = document['date'];
    this.quantity = document['quantity'];
    this.subsOk = document['subsOk'];
    this.substitutions = document['substitutions'];
    this.addedBy = document['addedBy'];
    this.lastUpdated = document['lastUpdated'];
    this.private = document['private'];
    this.urgent = document['urgent'];
    this.isCrossedOff = document['isCrossedOff'];
    this.listPositions = document['listPositions'];
  }
}