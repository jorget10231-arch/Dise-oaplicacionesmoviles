import 'evidence.dart';
import 'finding.dart';
import 'inspection.dart';

/// Agregado de dominio que representa una inspección completa.
/// Contiene los datos principales, sus hallazgos y evidencias.
class InspectionRecord {
  final Inspection inspection;
  final List<Finding> findings;
  final List<Evidence> evidences;

  const InspectionRecord({
    required this.inspection,
    this.findings = const [],
    this.evidences = const [],
  });

  InspectionRecord copyWith({
    Inspection? inspection,
    List<Finding>? findings,
    List<Evidence>? evidences,
  }) {
    return InspectionRecord(
      inspection: inspection ?? this.inspection,
      findings: findings ?? this.findings,
      evidences: evidences ?? this.evidences,
    );
  }
}
