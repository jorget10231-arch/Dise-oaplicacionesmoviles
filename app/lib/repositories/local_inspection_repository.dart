import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/inspection.dart';

/// Contrato para la persistencia local de inspecciones.
abstract class LocalInspectionRepository {
  Future<void> save(Inspection inspection);
  Future<List<Inspection>> getPending();
  Future<List<Inspection>> getAll();
  Future<void> markAsSynced(String inspectionId);
  Future<void> delete(String inspectionId);
}

/// Persistencia local basada en SharedPreferences.
/// Los registros sobreviven al cierre de la aplicación.
class SharedPreferencesInspectionRepository implements LocalInspectionRepository {
  static const _storageKey = 'safeinspect_inspections';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<void> save(Inspection inspection) async {
    final items = await getAll();
    final updated = [
      for (final item in items)
        if (item.id != inspection.id) item,
      inspection,
    ];
    final prefs = await _prefs;
    await prefs.setString(_storageKey, jsonEncode(updated.map((e) => e.toMap()).toList()));
  }

  @override
  Future<List<Inspection>> getAll() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((item) => Inspection.fromMap(Map<String, dynamic>.from(item as Map)))
          .toList(growable: false);
    } catch (_) {
      return const [];
    }
  }

  @override
  Future<List<Inspection>> getPending() async {
    final items = await getAll();
    return items.where((item) => item.isPending).toList(growable: false);
  }

  @override
  Future<void> markAsSynced(String inspectionId) async {
    final items = await getAll();
    final updated = items
        .map((item) => item.id == inspectionId
            ? item.copyWith(syncStatus: SyncStatus.synced)
            : item)
        .toList(growable: false);
    final prefs = await _prefs;
    await prefs.setString(_storageKey, jsonEncode(updated.map((e) => e.toMap()).toList()));
  }

  @override
  Future<void> delete(String inspectionId) async {
    final items = await getAll();
    final updated = items.where((item) => item.id != inspectionId);
    final prefs = await _prefs;
    await prefs.setString(_storageKey, jsonEncode(updated.map((e) => e.toMap()).toList()));
  }
}

/// Implementación en memoria para pruebas unitarias.
class InMemoryInspectionRepository implements LocalInspectionRepository {
  final Map<String, Inspection> _items = {};

  @override
  Future<void> save(Inspection inspection) async => _items[inspection.id] = inspection;

  @override
  Future<List<Inspection>> getAll() async => _items.values.toList(growable: false);

  @override
  Future<List<Inspection>> getPending() async =>
      _items.values.where((inspection) => inspection.isPending).toList(growable: false);

  @override
  Future<void> markAsSynced(String inspectionId) async {
    final item = _items[inspectionId];
    if (item != null) _items[inspectionId] = item.copyWith(syncStatus: SyncStatus.synced);
  }

  @override
  Future<void> delete(String inspectionId) async => _items.remove(inspectionId);
}
