import 'package:flutter_test/flutter_test.dart';
import 'package:safeinspect_mobile/main.dart';
import 'package:safeinspect_mobile/screens/home/home_page.dart';

void main() {
  testWidgets('muestra la pantalla de inicio de sesión', (tester) async {
    await tester.pumpWidget(const SafeInspectApp());

    expect(find.text('SafeInspect Mobile'), findsOneWidget);
    expect(find.text('Correo electrónico'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });

  testWidgets('muestra el panel principal de inspecciones', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.text('Panel de inspecciones'), findsOneWidget);
    expect(find.text('Nueva inspección'), findsOneWidget);
    expect(find.text('Historial'), findsOneWidget);
    expect(find.text('Sincronización'), findsOneWidget);
  });
}
