import 'package:flutter/material.dart';

class InspectionHistoryPage extends StatelessWidget {
  const InspectionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de inspecciones')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('Inspecciones registradas'),
              subtitle: Text('El historial se conectará con Firestore en la siguiente integración.'),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: Icon(Icons.sync),
              title: Text('Sincronización'),
              subtitle: Text('Los registros pendientes se mostrarán aquí cuando se implemente Offline-First.'),
            ),
          ),
        ],
      ),
    );
  }
}
