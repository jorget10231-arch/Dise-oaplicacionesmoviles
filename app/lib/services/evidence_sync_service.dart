import '../models/evidence.dart';
import '../repositories/evidence_repository.dart';

class EvidenceSyncService {
  EvidenceSyncService({required EvidenceRepository repository})
      : _repository = repository;

  final EvidenceRepository _repository;

  Future<EvidenceSyncResult> syncPending({bool hasConnection = true}) async {
    if (!hasConnection) {
      final pending = await _repository.getPending();
      return EvidenceSyncResult(
        uploaded: 0,
        failed: 0,
        pending: pending.length,
        connectionAvailable: false,
      );
    }

    final pending = await _repository.getPending();
    var uploaded = 0;
    var failed = 0;

    for (final evidence in pending) {
      try {
        final uploading = evidence.copyWith(
          syncStatus: EvidenceSyncStatus.uploading,
        );
        final result = await _repository.upload(uploading);
        await _repository.markAsSynced(result);
        uploaded++;
      } catch (_) {
        failed++;
      }
    }

    final remaining = await _repository.getPending();

    return EvidenceSyncResult(
      uploaded: uploaded,
      failed: failed,
      pending: remaining.length,
      connectionAvailable: true,
    );
  }
}

class EvidenceSyncResult {
  const EvidenceSyncResult({
    required this.uploaded,
    required this.failed,
    required this.pending,
    required this.connectionAvailable,
  });

  final int uploaded;
  final int failed;
  final int pending;
  final bool connectionAvailable;
}
