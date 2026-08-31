enum SyncStatus { pending, syncing, synced, failed }

class Inspection {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final String status;
  final String userId;
  final List<String> findings;
  final SyncStatus syncStatus;

  const Inspection({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.status,
    required this.userId,
    this.findings = const [],
    this.syncStatus = SyncStatus.pending,
  });

  bool get isPending =>
      syncStatus == SyncStatus.pending || syncStatus == SyncStatus.failed;

  Inspection copyWith({
    String? id,
    String? title,
    String? location,
    DateTime? date,
    String? status,
    String? userId,
    List<String>? findings,
    SyncStatus? syncStatus,
  }) {
    return Inspection(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      findings: findings ?? this.findings,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'date': date.toIso8601String(),
      'status': status,
      'userId': userId,
      'findings': findings,
      'syncStatus': syncStatus.name,
    };
  }

  factory Inspection.fromMap(Map<String, dynamic> map) {
    final statusValue = map['syncStatus'] as String? ?? 'pending';
    final syncStatus = SyncStatus.values.firstWhere(
      (value) => value.name == statusValue,
      orElse: () => SyncStatus.pending,
    );

    return Inspection(
      id: map['id'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      date: DateTime.parse(map['date'] as String),
      status: map['status'] as String,
      userId: map['userId'] as String,
      findings: List<String>.from(map['findings'] as List<dynamic>? ?? []),
      syncStatus: syncStatus,
    );
  }
}
