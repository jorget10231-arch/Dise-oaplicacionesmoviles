import 'package:flutter/material.dart';

import '../../models/inspection.dart';
import '../../repositories/local_inspection_repository.dart';
import '../../services/auth_service.dart';

class InspectionFormPage extends StatefulWidget {
  const InspectionFormPage({super.key, this.repository, this.authService});

  final LocalInspectionRepository? repository;
  final AuthService? authService;

  @override
  State<InspectionFormPage> createState() => _InspectionFormPageState();
}

class _InspectionFormPageState extends State<InspectionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _findingController = TextEditingController();
  bool _saving = false;

  LocalInspectionRepository get _repository =>
      widget.repository ?? SharedPreferencesInspectionRepository();

  AuthService get _authService => widget.authService ?? AuthService();

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _findingController.dispose();
    super.dispose();
  }

  Future<void> _saveDraft() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);
    try {
      final userId = _authService.currentUser?.uid ?? 'usuario-local';
      final inspection = Inspection(
        id: 'inspection-${DateTime.now().microsecondsSinceEpoch}',
        title: _titleController.text.trim(),
        location: _locationController.text.trim(),
        date: DateTime.now(),
        status: 'draft',
        userId: userId,
        findings: _findingController.text.trim().isEmpty
            ? const []
            : [_findingController.text.trim()],
        syncStatus: SyncStatus.pending,
      );

      await _repository.save(inspection);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Inspección guardada como borrador local.')),
      );
      Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No fue posible guardar la inspección.')),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva inspección')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Nombre de la inspección', border: OutlineInputBorder()),
              validator: (value) => value == null || value.trim().isEmpty ? 'Ingrese un nombre' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Ubicación', border: OutlineInputBorder()),
              validator: (value) => value == null || value.trim().isEmpty ? 'Ingrese la ubicación' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _findingController,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Hallazgo / observación', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Agregar evidencia fotográfica'),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _saving ? null : _saveDraft,
              icon: _saving
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.save),
              label: Text(_saving ? 'Guardando...' : 'Guardar inspección'),
            ),
          ],
        ),
      ),
    );
  }
}
