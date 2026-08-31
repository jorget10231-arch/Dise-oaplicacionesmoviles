import '../models/finding.dart';

/// Servicio de dominio para las operaciones cloud de hallazgos.
///
/// La implementación concreta de Firestore se conectará en la integración
/// Firebase. La ruta queda centralizada para evitar duplicar reglas de acceso.
class FindingCloudService {
  const FindingCloudService();

  String documentPath(Finding finding) {
    return 'inspections/${finding.inspectionId}/findings/${finding.id}';
  }

  Map<String, dynamic> toFirestore(Finding finding) {
    return {
      'id': finding.id,
      'inspectionId': finding.inspectionId,
      'description': finding.description,
      'severity': finding.severity.name,
      'createdAt': finding.createdAt.toIso8601String(),
    };
  }

  Finding fromFirestore(Map<String, dynamic> data) {
    return Finding.fromMap(data);
  }
}
