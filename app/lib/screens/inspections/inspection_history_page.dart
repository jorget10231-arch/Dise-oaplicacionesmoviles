import 'package:flutter/material.dart';

import '../../models/inspection.dart';
import '../../repositories/local_inspection_repository.dart';

class InspectionHistoryPage extends StatefulWidget {
  const InspectionHistoryPage({super.key, this.repository});

  final LocalInspectionRepository? repository;

  @override
  State<InspectionHistoryPage> createState() => _InspectionHistoryPageState();
}

class _InspectionHistoryPageState extends State<InspectionHistoryPage> {
  late Future<List<Inspection>> _inspectionsFuture;

  LocalInspectionRepository get _repository =>
      widget.repository ?? SharedPreferencesInspectionRepository();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    _inspectionsFuture = _repository.getAll();
  }

  Future<void> _refresh() async {
    setState(_load);
    await _inspectionsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de inspecciones'),
        actions: [
          IconButton(
            tooltip: 'Actualizar',
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Inspection>>(
        future: _inspectionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('No fue posible cargar el historial.'));
          }

          final inspections = snapshot.data ?? const <Inspection>[];
          final pending = inspections.where((item) => item.isPending).length;

          if (inspections.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: const [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.assignment_turned_in),
                      title: Text('Sin inspecciones registradas'),
                      subtitle: Text('Las inspecciones guardadas aparecerán aquí.'),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: inspections.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.sync),
                      title: Text('Pendientes de sincronización: $pending'),
                      subtitle: const Text('Los registros pendientes se sincronizarán con Firebase.'),
                    ),
                  );
                }

                final inspection = inspections[index - 1];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      inspection.isPending ? Icons.cloud_upload : Icons.cloud_done,
                    ),
                    title: Text(inspection.title),
                    subtitle: Text(
                      '${inspection.location}\n${inspection.findings.join(' · ')}',
                    ),
                    isThreeLine: true,
                    trailing: Text(
                      inspection.isPending ? 'Pendiente' : 'Sincronizada',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
