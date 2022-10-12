import 'package:counter_workshop/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Failure', () {
    testWidgets(
      'Count to 6 but check 5',
      (WidgetTester tester) async {
        // Setup
        app.main();
        await tester.pumpAndSettle();

        // Find first Card with count at 1
        final Finder card = find.byType(Card).first;
        await tester.tap(card);
        await tester.pumpAndSettle();

        // Find increment button
        final Finder button = find.byIcon(Icons.add);

        // Do
        for (var i = 0; i < 5; i++) {
          await tester.tap(button);
          await tester.pumpAndSettle();
        }

        // test
        expect(find.text('5'), findsOneWidget);
      },
    );
  });
}
