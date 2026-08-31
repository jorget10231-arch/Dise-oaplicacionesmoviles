import '../models/inspection.dart';

/// Servicio responsable de preparar y reconstruir inspecciones para la capa
/// cloud. La conexión concreta con Firebase se incorporará en la integración
/// Firebase real.
class InspectionCloudService {
  const InspectionCloudService();

  /// Ruta del documento principal de una inspección en Firestore.
  String documentPath(Inspection inspection) {
    return 'inspections/${inspection.id}';
  }

  /// Convierte una inspección al mapa que utilizará Firestore.
  Map<String, dynamic> toFirestore(Inspection inspection) {
    return {
      'id': inspection.id,
      'title': inspection.title,
      'location': inspection.location,
      'date': inspection.date.toIso8601String(),
      'status': inspection.status,
      'userId': inspection.userId,
      'findings': inspection.findings,
      'syncStatus': inspection.syncStatus.name,
    };
  }

  /// Reconstruye el modelo de dominio a partir de datos recuperados de Firestore.
  Inspection fromFirestore(Map<String, dynamic> data) {
    return Inspection.fromMap(data);
  }
}
