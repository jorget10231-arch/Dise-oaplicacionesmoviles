import 'package:flutter_test/flutter_test.dart';
import 'package:safeinspect_mobile/main.dart';

void main() {
  testWidgets('muestra la pantalla inicial de SafeInspect', (tester) async {
    await tester.pumpWidget(const SafeInspectApp());

    expect(find.text('SafeInspect Mobile'), findsOneWidget);
    expect(find.text('Nueva inspección'), findsOneWidget);
    expect(find.text('Historial'), findsOneWidget);
  });
}
