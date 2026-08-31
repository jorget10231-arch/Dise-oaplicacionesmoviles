import '../models/inspection.dart';
import '../services/firebase_service.dart';

class InspectionRepository {
  InspectionRepository({FirebaseService? firebaseService})
      : _firebaseService = firebaseService ?? FirebaseService();

  final FirebaseService _firebaseService;

  Future<void> saveToCloud(Inspection inspection) async {
    await _firebaseService.firestore
        .collection('inspections')
        .doc(inspection.id)
        .set(inspection.toMap());
  }
}
