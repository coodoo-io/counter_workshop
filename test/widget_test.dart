// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/local/counter.db.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterApi extends Mock implements CounterApi {}

void main() {
  // Mocktail solution
  final mockCounterApi = MockCounterApi();
  // fetch
  when(() => mockCounterApi.fetchCounter(any())).thenAnswer(
    (_) => Future.value(
      CounterResponseDto(
        counterValue: 0,
        sysId: '1',
        createdAt: DateTime.now(),
      ),
    ),
  );
  // update
  when(() => mockCounterApi.updateCounter(any(), any())).thenAnswer(
    (_) => Future.value(),
  );

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      App(counterRepository: CounterRepository(counterApi: mockCounterApi, counterDatabase: CounterDatabase())),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Because of FakeApi delay

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
