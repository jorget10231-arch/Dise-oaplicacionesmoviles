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
}
