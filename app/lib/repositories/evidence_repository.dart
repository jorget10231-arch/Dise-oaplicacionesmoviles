import '../models/evidence.dart';

/// Contrato para gestionar evidencias de inspección.
///
/// Mantiene desacoplada la lógica de negocio de la tecnología concreta de
/// almacenamiento local o Firebase Storage.
abstract class EvidenceRepository {
  Future<void> saveLocal(Evidence evidence);

  Future<List<Evidence>> getPending();

  Future<Evidence> upload(Evidence evidence);

  Future<void> markAsSynced(Evidence evidence);
}

/// Implementación temporal para validar el flujo antes de conectar
/// Firebase Storage y una base de datos local persistente.
class InMemoryEvidenceRepository implements EvidenceRepository {
  final Map<String, Evidence> _items = {};

  @override
  Future<void> saveLocal(Evidence evidence) async {
    _items[evidence.id] = evidence;
  }

  @override
  Future<List<Evidence>> getPending() async {
    return _items.values
        .where((evidence) => evidence.isPending)
        .toList(growable: false);
  }

  @override
  Future<Evidence> upload(Evidence evidence) async {
    return evidence.copyWith(
      syncStatus: EvidenceSyncStatus.synced,
    );
  }

  @override
  Future<void> markAsSynced(Evidence evidence) async {
    _items[evidence.id] = evidence.copyWith(
      syncStatus: EvidenceSyncStatus.synced,
    );
  }
}
