import 'package:counter/data/counter/counter.repository.dart';
import 'package:counter/data/counter/data_source/api/counter.api.dart';
import 'package:counter/data/counter/data_source/db/counter.db.dart';
import 'package:counter/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterApi extends Mock implements CounterApi {}

class MockCounterDb extends Mock implements CounterDb {}

void main() {
  late MockCounterApi counterApi;
  late MockCounterDb counterDb;

  setUpAll(() {
    counterDb = MockCounterDb();
    counterApi = MockCounterApi();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    when(() => counterApi.getInitalValue())
        .thenAnswer((invocation) => Future.value(0));

    await tester.pumpWidget(MyApp(
      counterRepository:
          CounterRepository(counterApi: counterApi, counterDB: counterDb),
    ));
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test inital value is 10',
      (WidgetTester tester) async {
    when(() => counterApi.getInitalValue())
        .thenAnswer((invocation) => Future.value(10));

    await tester.pumpWidget(MyApp(
      counterRepository:
          CounterRepository(counterApi: counterApi, counterDB: counterDb),
    ));
    expect(find.text('10'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('0'), findsNothing);
    expect(find.text('11'), findsOneWidget);
  });
}
