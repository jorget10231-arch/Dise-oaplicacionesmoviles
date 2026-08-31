import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/inspection.dart';

class FirestoreService {
  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get inspections =>
      _firestore.collection('inspections');

  Future<void> saveInspection(Inspection inspection) {
    return inspections.doc(inspection.id).set(inspection.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchInspections(String userId) {
    return inspections.where('userId', isEqualTo: userId).snapshots();
  }
}
