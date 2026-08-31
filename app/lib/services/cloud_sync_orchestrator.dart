import '../models/inspection_record.dart';
import '../repositories/evidence_repository.dart';
import '../repositories/inspection_repository.dart';
import 'finding_cloud_service.dart';
import 'inspection_cloud_service.dart';

/// Orquestador de la integración cloud de SafeInspect.
///
/// Centraliza las rutas y transformaciones de las tres piezas del agregado:
/// inspección, hallazgos y evidencias. La ejecución real contra Firebase se
/// incorporará cuando se configure el SDK en Flutter.
class CloudSyncOrchestrator {
  CloudSyncOrchestrator({
    required InspectionRepository inspectionRepository,
    required EvidenceRepository evidenceRepository,
    InspectionCloudService inspectionCloudService = const InspectionCloudService(),
    FindingCloudService findingCloudService = const FindingCloudService(),
  })  : _inspectionRepository = inspectionRepository,
        _evidenceRepository = evidenceRepository,
        _inspectionCloudService = inspectionCloudService,
        _findingCloudService = findingCloudService;

  final InspectionRepository _inspectionRepository;
  final EvidenceRepository _evidenceRepository;
  final InspectionCloudService _inspectionCloudService;
  final FindingCloudService _findingCloudService;

  Future<CloudSyncPlan> buildPlan(InspectionRecord record) async {
    final inspectionPath = _inspectionCloudService.documentPath(record.inspection);
    final findingPaths = record.findings
        .map(_findingCloudService.documentPath)
        .toList(growable: false);

    final evidenceIds = record.evidences.map((evidence) => evidence.id).toList(growable: false);

    return CloudSyncPlan(
      inspectionPath: inspectionPath,
      findingPaths: findingPaths,
      evidenceIds: evidenceIds,
    );
  }

  /// Punto de entrada que utilizará la aplicación para preparar una inspección
  /// completa antes de ejecutar la sincronización real.
  Future<CloudSyncPlan> synchronize(InspectionRecord record) async {
    final plan = await buildPlan(record);

    // Los repositorios quedan inyectados para permitir sustituir las
    // implementaciones temporales por Firestore/Storage sin cambiar la UI.
    await _inspectionRepository.saveToCloud(
      record.inspection.copyWith(),
    );

    for (final evidence in record.evidences) {
      await _evidenceRepository.markAsSynced(evidence);
    }

    return plan;
  }
}

class CloudSyncPlan {
  const CloudSyncPlan({
    required this.inspectionPath,
    required this.findingPaths,
    required this.evidenceIds,
  });

  final String inspectionPath;
  final List<String> findingPaths;
  final List<String> evidenceIds;
}
