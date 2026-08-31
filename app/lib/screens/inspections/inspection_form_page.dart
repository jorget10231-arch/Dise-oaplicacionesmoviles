import 'package:flutter/material.dart';

class InspectionFormPage extends StatefulWidget {
  const InspectionFormPage({super.key});

  @override
  State<InspectionFormPage> createState() => _InspectionFormPageState();
}

class _InspectionFormPageState extends State<InspectionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _findingController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _findingController.dispose();
    super.dispose();
  }

  void _saveDraft() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Inspección guardada como borrador local.')),
    );
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
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text('Agregar evidencia fotográfica'),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _saveDraft,
              icon: const Icon(Icons.save),
              label: const Text('Guardar inspección'),
            ),
          ],
        ),
      ),
    );
  }
}
