class Inspection {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final String status;
  final List<String> findings;

  const Inspection({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.status,
    this.findings = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'date': date.toIso8601String(),
      'status': status,
      'findings': findings,
    };
  }

  factory Inspection.fromMap(Map<String, dynamic> map) {
    return Inspection(
      id: map['id'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      date: DateTime.parse(map['date'] as String),
      status: map['status'] as String,
      findings: List<String>.from(map['findings'] as List<dynamic>? ?? []),
    );
  }
}
