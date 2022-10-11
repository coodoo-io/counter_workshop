import 'package:counter_workshop/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Increment and decrement', () {
    testWidgets(
      'Increment Counter',
      (WidgetTester tester) async {
        // Setup
        app.main();
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 10));

        // Find first Card with count at 1
        final Finder card = find.byType(Card).first;
        await tester.tap(card);
        await tester.pumpAndSettle();

        // Find increment button
        final Finder button = find.byIcon(Icons.add);

        // Do
        await tester.tap(button);
        await tester.pumpAndSettle();

        // test
        expect(find.text('2'), findsOneWidget);
      },
    );
    testWidgets(
      'Decrement Counter',
      (WidgetTester tester) async {
        // Setup
        app.main();
        await tester.pumpAndSettle();

        // This part isn't neccessary anymore because the route state from the previous state is still saved but the rest is reset
        // Find first Card with count at 1
        // final Finder card = find.byType(Card).first;
        // await tester.tap(card);
        // await tester.pumpAndSettle();

        // Find increment button
        final Finder button = find.byIcon(Icons.remove);

        // Do
        await tester.tap(button);
        await tester.pumpAndSettle();

        // test
        expect(find.text('0'), findsOneWidget);
      },
    );
  });
}
