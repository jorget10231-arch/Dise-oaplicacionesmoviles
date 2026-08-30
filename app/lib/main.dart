import 'package:flutter/material.dart';

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
            const Text('Registro de inspecciones, hallazgos y evidencias fotográficas.'),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.assignment_add),
              label: const Text('Nueva inspección'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.history),
              label: const Text('Historial'),
            ),
            const SizedBox(height: 24),
            const Card(
              child: ListTile(
                leading: Icon(Icons.cloud_done),
                title: Text('Estado de sincronización'),
                subtitle: Text('Arquitectura preparada para Firebase y sincronización Offline-First.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
