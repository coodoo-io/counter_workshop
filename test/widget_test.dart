// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
      const Duration(milliseconds: 300), // Because of FakeApi delay
    );

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(milliseconds: 300)); // Because of FakeApi delay

    // Verify that our counter does not decremented.
    expect(find.text('-1'), findsNothing);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(const Duration(milliseconds: 300)); // Because of FakeApi delay
    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle(const Duration(milliseconds: 300)); // Because of FakeApi delay
    // Verify that our counter has decremented.
    expect(find.text('1'), findsNothing);
    expect(find.text('0'), findsOneWidget);
  });
}
