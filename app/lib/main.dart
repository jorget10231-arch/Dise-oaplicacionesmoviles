import 'package:flutter/material.dart';
import 'screens/inspection_form_page.dart';

void main() {
  runApp(const SafeInspectApp());
}

class SafeInspectApp extends StatelessWidget {
  const SafeInspectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeInspect Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SafeInspect Mobile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inspecciones de seguridad', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Registra inspecciones, hallazgos y evidencias fotográficas desde el dispositivo móvil.'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InspectionFormPage()),
                ),
                icon: const Icon(Icons.assignment_add),
                label: const Text('Nueva inspección'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.history),
                label: const Text('Historial'),
              ),
            ),
            const SizedBox(height: 24),
            const Card(
              child: ListTile(
                leading: Icon(Icons.cloud_done),
                title: Text('Estado de sincronización'),
                subtitle: Text('Base preparada para Firebase y estrategia Offline-First.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
