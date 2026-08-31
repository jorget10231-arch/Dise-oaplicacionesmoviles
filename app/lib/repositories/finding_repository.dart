import '../models/finding.dart';

/// Contrato de acceso a hallazgos asociados a una inspección.
abstract class FindingRepository {
  Future<void> saveLocal(Finding finding);

  Future<List<Finding>> getByInspection(String inspectionId);

  Future<void> saveToCloud(Finding finding);
}

/// Implementación temporal en memoria para validar la arquitectura antes
/// de conectar Firestore de forma real.
class InMemoryFindingRepository implements FindingRepository {
  final Map<String, Finding> _items = {};

  @override
  Future<void> saveLocal(Finding finding) async {
    _items[finding.id] = finding;
  }

  @override
  Future<List<Finding>> getByInspection(String inspectionId) async {
    return _items.values
        .where((finding) => finding.inspectionId == inspectionId)
        .toList(growable: false);
  }

  @override
  Future<void> saveToCloud(Finding finding) async {
    // La implementación real utilizará Firestore.
    // La operación queda definida en el contrato para mantener desacoplamiento.
  }
}
