import '../models/inspection.dart';
import '../services/firebase_service.dart';
import 'local_inspection_repository.dart';

class InspectionRepository {
  InspectionRepository({
    FirebaseService? firebaseService,
    LocalInspectionRepository? localRepository,
  })  : _firebaseService = firebaseService ?? FirebaseService(),
        _localRepository = localRepository ?? InMemoryInspectionRepository();

  final FirebaseService _firebaseService;
  final LocalInspectionRepository _localRepository;

  Future<void> save(Inspection inspection) async {
    await _localRepository.save(inspection);
  }

  Future<List<Inspection>> getPending() {
    return _localRepository.getPending();
  }

  Future<void> saveToCloud(Inspection inspection) async {
    await _firebaseService.firestore
        .collection('inspections')
        .doc(inspection.id)
        .set(inspection.toMap());

    await _localRepository.markAsSynced(inspection.id);
  }

  Future<void> syncPending() async {
    final pending = await _localRepository.getPending();

    for (final inspection in pending) {
      try {
        await saveToCloud(inspection);
      } catch (_) {
        // El registro permanece pendiente para un nuevo intento.
      }
    }
  }
}
