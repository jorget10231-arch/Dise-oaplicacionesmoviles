import 'package:flutter/material.dart';

import '../../repositories/local_inspection_repository.dart';
import '../../services/auth_service.dart';
import '../../services/inspection_sync_service.dart';
import '../inspections/inspection_form_page.dart';
import '../inspections/inspection_history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.authService, this.repository, this.syncService});

  final AuthService? authService;
  final LocalInspectionRepository? repository;
  final InspectionSyncService? syncService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LocalInspectionRepository _repository;
  late final InspectionSyncService _syncService;
  int _pending = 0;
  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? SharedPreferencesInspectionRepository();
    _syncService = widget.syncService ?? InspectionSyncService(localRepository: _repository);
    _loadPending();
  }

  Future<void> _loadPending() async {
    final pending = await _repository.getPending();
    if (!mounted) return;
    setState(() => _pending = pending.length);
  }

  Future<void> _sync() async {
    if (_syncing) return;
    setState(() => _syncing = true);
    try {
      final synced = await _syncService.syncPending();
      await _loadPending();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(synced > 0 ? '$synced inspección(es) sincronizada(s).' : 'No se sincronizaron inspecciones.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No fue posible sincronizar. Verifique la conexión.')),
      );
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  Future<void> _openForm() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => InspectionFormPage(repository: _repository)),
    );
    await _loadPending();
  }

  Future<void> _openHistory() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => InspectionHistoryPage(repository: _repository)),
    );
    await _loadPending();
  }

  Future<void> _logout() async {
    await (widget.authService ?? AuthService()).signOut();
    if (!mounted) return;
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
            onPressed: _logout,
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
              onTap: _openForm,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historial'),
              subtitle: const Text('Consultar inspecciones registradas.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _openHistory,
            ),
          ),
          Card(
            child: ListTile(
              leading: _syncing
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.sync),
              title: const Text('Sincronización'),
              subtitle: Text('Pendientes de sincronización: $_pending'),
              trailing: IconButton(
                tooltip: 'Sincronizar ahora',
                onPressed: _syncing ? null : _sync,
                icon: const Icon(Icons.cloud_upload),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
