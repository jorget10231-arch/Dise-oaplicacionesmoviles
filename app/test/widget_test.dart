import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safeinspect_mobile/main.dart';
import 'package:safeinspect_mobile/repositories/local_inspection_repository.dart';
import 'package:safeinspect_mobile/screens/home/home_page.dart';
import 'package:safeinspect_mobile/services/inspection_sync_service.dart';

void main() {
  testWidgets('muestra la pantalla de inicio de sesión', (tester) async {
    await tester.pumpWidget(const SafeInspectApp());

    expect(find.text('SafeInspect Mobile'), findsOneWidget);
    expect(find.text('Correo electrónico'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });

  testWidgets('muestra el panel principal de inspecciones', (tester) async {
    final repository = InMemoryInspectionRepository();
    final syncService = InspectionSyncService.disabled(
      localRepository: repository,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(
          repository: repository,
          syncService: syncService,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Panel de inspecciones'), findsOneWidget);
    expect(find.text('Nueva inspección'), findsOneWidget);
    expect(find.text('Historial'), findsOneWidget);
    expect(find.text('Sincronización'), findsOneWidget);
  });
}
