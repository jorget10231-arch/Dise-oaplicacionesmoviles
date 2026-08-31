import '../models/evidence.dart';
import '../models/finding.dart';
import '../models/inspection.dart';
import '../models/inspection_record.dart';
import '../repositories/evidence_repository.dart';
import '../repositories/inspection_repository.dart';

/// Orquesta la sincronización del agregado completo de una inspección.
///
/// En esta etapa la implementación cloud de la inspección ya existe en
/// InspectionRepository y la de evidencias en EvidenceRepository. La
/// persistencia local y Firebase reales se conectarán posteriormente.
class InspectionSyncService {
  InspectionSyncService({
    required InspectionRepository inspectionRepository,
    required EvidenceRepository evidenceRepository,
  })  : _inspectionRepository = inspectionRepository,
        _evidenceRepository = evidenceRepository;

  final InspectionRepository _inspectionRepository;
  final EvidenceRepository _evidenceRepository;

  Future<InspectionSyncResult> synchronize(
    InspectionRecord record, {
    bool hasConnection = true,
  }) async {
    if (!hasConnection) {
      return const InspectionSyncResult(
        inspectionSynced: false,
        findingsSynced: false,
        evidencesUploaded: 0,
        evidencesFailed: 0,
        connectionAvailable: false,
      );
    }

    var inspectionSynced = false;
    var findingsSynced = false;
    var evidencesUploaded = 0;
    var evidencesFailed = 0;

    try {
      final syncingInspection = record.inspection.copyWith(
        syncStatus: SyncStatus.syncing,
      );
      await _inspectionRepository.saveToCloud(syncingInspection);
      inspectionSynced = true;
    } catch (_) {
      return const InspectionSyncResult(
        inspectionSynced: false,
        findingsSynced: false,
        evidencesUploaded: 0,
        evidencesFailed: 0,
        connectionAvailable: true,
      );
    }

    try {
      // Los hallazgos se encuentran modelados y asociados mediante
      // inspectionId. La escritura en Firestore se incorporará al servicio
      // cloud de hallazgos en la integración Firebase real.
      findingsSynced = record.findings.every(
        (finding) => finding.inspectionId == record.inspection.id,
      );
    } catch (_) {
      findingsSynced = false;
    }

    for (final evidence in record.evidences) {
      if (evidence.inspectionId != record.inspection.id) {
        evidencesFailed++;
        continue;
      }

      try {
        final uploading = evidence.copyWith(
          syncStatus: EvidenceSyncStatus.uploading,
        );
        final uploaded = await _evidenceRepository.upload(uploading);
        await _evidenceRepository.markAsSynced(uploaded);
        evidencesUploaded++;
      } catch (_) {
        evidencesFailed++;
      }
    }

    return InspectionSyncResult(
      inspectionSynced: inspectionSynced,
      findingsSynced: findingsSynced,
      evidencesUploaded: evidencesUploaded,
      evidencesFailed: evidencesFailed,
      connectionAvailable: true,
    );
  }
}

class InspectionSyncResult {
  const InspectionSyncResult({
    required this.inspectionSynced,
    required this.findingsSynced,
    required this.evidencesUploaded,
    required this.evidencesFailed,
    required this.connectionAvailable,
  });

  final bool inspectionSynced;
  final bool findingsSynced;
  final int evidencesUploaded;
  final int evidencesFailed;
  final bool connectionAvailable;

  bool get complete =>
      inspectionSynced &&
      findingsSynced &&
      evidencesFailed == 0;
}
