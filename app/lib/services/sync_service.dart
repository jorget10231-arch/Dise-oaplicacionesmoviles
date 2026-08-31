import '../models/inspection.dart';
import '../repositories/local_inspection_repository.dart';
import '../repositories/inspection_repository.dart';

/// Coordina el envío de inspecciones pendientes hacia la nube.
///
/// La detección real de conectividad se incorporará cuando se implemente
/// la persistencia local y la integración Firebase en el dispositivo.
class SyncService {
  SyncService({
    required LocalInspectionRepository localRepository,
    required InspectionRepository cloudRepository,
  })  : _localRepository = localRepository,
        _cloudRepository = cloudRepository;

  final LocalInspectionRepository _localRepository;
  final InspectionRepository _cloudRepository;

  Future<SyncResult> syncPending({bool hasConnection = true}) async {
    if (!hasConnection) {
      return const SyncResult(
        synced: 0,
        failed: 0,
        pending: 0,
        connectionAvailable: false,
      );
    }

    final pending = await _localRepository.getPending();
    var synced = 0;
    var failed = 0;

    for (final inspection in pending) {
      try {
        final syncing = inspection.copyWith(syncStatus: SyncStatus.syncing);
        await _cloudRepository.saveToCloud(syncing);
        await _localRepository.markAsSynced(inspection.id);
        synced++;
      } catch (_) {
        failed++;
      }
    }

    final remaining = await _localRepository.getPending();

    return SyncResult(
      synced: synced,
      failed: failed,
      pending: remaining.length,
      connectionAvailable: true,
    );
  }
}

class SyncResult {
  const SyncResult({
    required this.synced,
    required this.failed,
    required this.pending,
    required this.connectionAvailable,
  });

  final int synced;
  final int failed;
  final int pending;
  final bool connectionAvailable;
}
