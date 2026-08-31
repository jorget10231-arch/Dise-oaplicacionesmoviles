enum EvidenceSyncStatus { pending, uploading, synced, failed }

class Evidence {
  final String id;
  final String inspectionId;
  final String? findingId;
  final String localPath;
  final String? storageUrl;
  final EvidenceSyncStatus syncStatus;
  final DateTime createdAt;

  const Evidence({
    required this.id,
    required this.inspectionId,
    this.findingId,
    required this.localPath,
    this.storageUrl,
    this.syncStatus = EvidenceSyncStatus.pending,
    required this.createdAt,
  });

  bool get isPending =>
      syncStatus == EvidenceSyncStatus.pending ||
      syncStatus == EvidenceSyncStatus.failed;

  Evidence copyWith({
    String? id,
    String? inspectionId,
    String? findingId,
    String? localPath,
    String? storageUrl,
    EvidenceSyncStatus? syncStatus,
    DateTime? createdAt,
  }) {
    return Evidence(
      id: id ?? this.id,
      inspectionId: inspectionId ?? this.inspectionId,
      findingId: findingId ?? this.findingId,
      localPath: localPath ?? this.localPath,
      storageUrl: storageUrl ?? this.storageUrl,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inspectionId': inspectionId,
      'findingId': findingId,
      'localPath': localPath,
      'storageUrl': storageUrl,
      'syncStatus': syncStatus.name,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Evidence.fromMap(Map<String, dynamic> map) {
    final statusValue = map['syncStatus'] as String? ?? 'pending';
    final syncStatus = EvidenceSyncStatus.values.firstWhere(
      (value) => value.name == statusValue,
      orElse: () => EvidenceSyncStatus.pending,
    );

    return Evidence(
      id: map['id'] as String,
      inspectionId: map['inspectionId'] as String,
      findingId: map['findingId'] as String?,
      localPath: map['localPath'] as String,
      storageUrl: map['storageUrl'] as String?,
      syncStatus: syncStatus,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
