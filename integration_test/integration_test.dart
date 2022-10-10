import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
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
        await tester.pumpWidget(
          App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
        );
        await tester.pumpAndSettle();

        // Find first Card with count at 1
        final Finder card = find.widgetWithText(InkWell, '1');
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
        await Future.delayed(const Duration(seconds: 10));
        // Setup
        await tester.pumpWidget(
          App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
        );
        await tester.pumpAndSettle();

        // This part isn't neccessary anymore because the route state from the previous state is still saved
        // Find first Card with count at 1
        // final Finder card = find.widgetWithText(InkWell, '1');
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
