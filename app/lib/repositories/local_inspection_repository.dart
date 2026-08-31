import '../models/inspection.dart';

/// Contrato para la persistencia local de inspecciones.
///
/// La implementación concreta se podrá cambiar sin modificar las pantallas
/// ni la lógica de negocio del repositorio principal.
abstract class LocalInspectionRepository {
  Future<void> save(Inspection inspection);

  Future<List<Inspection>> getPending();

  Future<void> markAsSynced(String inspectionId);

  Future<void> delete(String inspectionId);
}

/// Implementación temporal en memoria para validar el contrato antes de
/// incorporar una base de datos local real.
class InMemoryInspectionRepository implements LocalInspectionRepository {
  final Map<String, Inspection> _items = {};
  final Set<String> _synced = {};

  @override
  Future<void> save(Inspection inspection) async {
    _items[inspection.id] = inspection;
    _synced.remove(inspection.id);
  }

  @override
  Future<List<Inspection>> getPending() async {
    return _items.values
        .where((inspection) => !_synced.contains(inspection.id))
        .toList(growable: false);
  }

  @override
  Future<void> markAsSynced(String inspectionId) async {
    if (_items.containsKey(inspectionId)) {
      _synced.add(inspectionId);
    }
  }

  @override
  Future<void> delete(String inspectionId) async {
    _items.remove(inspectionId);
    _synced.remove(inspectionId);
  }
}
