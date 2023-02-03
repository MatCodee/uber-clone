
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workii/models/Driver.dart';

class DriverProvider {
  CollectionReference? _ref;

  DriverProvider() {
    _ref = FirebaseFirestore.instance.collection('Driver');
  }

  Future<void> create(Driver driver) {
    return _ref!.doc(driver.id).set(driver.toJson());
  }
}
