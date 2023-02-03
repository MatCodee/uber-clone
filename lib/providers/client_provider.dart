
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workii/models/client.dart';

class ClientProvider {
  CollectionReference? _ref;

  ClientProvider() {
    _ref = FirebaseFirestore.instance.collection('Client');
  }

  Future<void> create(Client client) {
    return _ref!.doc(client.id).set(client.toJson());
  }
}
