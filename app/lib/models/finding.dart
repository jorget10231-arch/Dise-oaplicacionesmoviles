enum FindingSeverity { low, medium, high, critical }

class Finding {
  final String id;
  final String inspectionId;
  final String description;
  final FindingSeverity severity;
  final DateTime createdAt;

  const Finding({
    required this.id,
    required this.inspectionId,
    required this.description,
    required this.severity,
    required this.createdAt,
  });

  Finding copyWith({
    String? id,
    String? inspectionId,
    String? description,
    FindingSeverity? severity,
    DateTime? createdAt,
  }) {
    return Finding(
      id: id ?? this.id,
      inspectionId: inspectionId ?? this.inspectionId,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inspectionId': inspectionId,
      'description': description,
      'severity': severity.name,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Finding.fromMap(Map<String, dynamic> map) {
    final severityValue = map['severity'] as String? ?? 'medium';
    final severity = FindingSeverity.values.firstWhere(
      (value) => value.name == severityValue,
      orElse: () => FindingSeverity.medium,
    );

    return Finding(
      id: map['id'] as String,
      inspectionId: map['inspectionId'] as String,
      description: map['description'] as String,
      severity: severity,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
