import 'package:cloud_firestore/cloud_firestore.dart';

import '../repositories/local_inspection_repository.dart';

class InspectionSyncService {
  InspectionSyncService({
    FirebaseFirestore? firestore,
    LocalInspectionRepository? localRepository,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _localRepository =
            localRepository ?? SharedPreferencesInspectionRepository();

  final FirebaseFirestore _firestore;
  final LocalInspectionRepository _localRepository;

  Future<int> syncPending() async {
    final pending = await _localRepository.getPending();
    var synced = 0;

    for (final inspection in pending) {
      try {
        await _firestore
            .collection('inspections')
            .doc(inspection.id)
            .set(inspection.toMap(), SetOptions(merge: true));
        await _localRepository.markAsSynced(inspection.id);
        synced++;
      } catch (_) {
        // El registro permanece pendiente para permitir un nuevo intento.
      }
    }

    return synced;
  }
}
