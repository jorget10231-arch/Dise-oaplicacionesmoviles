import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../inspections/inspection_form_page.dart';
import '../inspections/inspection_history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.authService});

  final AuthService? authService;

  Future<void> _logout(BuildContext context) async {
    await (authService ?? AuthService()).signOut();
    if (!context.mounted) return;
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeInspect Mobile'),
        actions: [
          IconButton(
            tooltip: 'Cerrar sesión',
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Panel de inspecciones', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          const Text('Gestione sus inspecciones de seguridad desde un solo lugar.'),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.assignment_add),
              title: const Text('Nueva inspección'),
              subtitle: const Text('Registrar una nueva inspección de seguridad.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const InspectionFormPage()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historial'),
              subtitle: const Text('Consultar inspecciones registradas.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const InspectionHistoryPage()),
              ),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.sync),
              title: Text('Sincronización'),
              subtitle: Text('Pendientes de sincronización: 0'),
              trailing: Icon(Icons.cloud_done),
            ),
          ),
        ],
      ),
    );
  }
}
