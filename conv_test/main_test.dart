import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_workshop/main.dart' as main_app;

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group('add überstunden', () {
      tTestWidgets('Open Überstunden', (t) async {
        await find.text('Überstunden').should(findsOneWidget);
        await find.text('Überstunden').tap();
        await find.byIcon(Icons.add).should(findsOneWidget);
        await find.byIcon(Icons.add).tap();
        await find.byIcon(Icons.add).tap();
        await find.byIcon(Icons.add).tap();
        await find.textContaining('24').should(findsOneWidget);
        await t.pageBack();
        await find.text('Überstunden').should(findsOneWidget);
        await find.textContaining('24').should(findsOneWidget);
      });
    });

    group('open settings', () {
      tTestWidgets('Open Settings Check English', (t) async {
        await find.byIcon(Icons.settings).should(findsOneWidget);
        await find.byIcon(Icons.settings).tap();
        await find.text('English').should(findsOneWidget);
        await find.text('English').tap();
        await t.pageBack();
      });
    });

    group('open add dialog', () {
      tTestWidgets('should open page', (t) async {
        await find.byIcon(Icons.add).should(findsOneWidget);
        await find.byIcon(Icons.add).tap();
      });
    });

    group('my custom test group', () {
      tTestWidgets('calling custom method', (t) async {
        await t.myCustomCommand();
      });
    });
  });
}

class MyConvenientTestSlot extends ConvenientTestSlot {
  @override
  Future<void> appMain(AppMainExecuteMode mode) async => main_app.main();

  @override
  BuildContext? getNavContext(ConvenientTest t) {
    return AppView.navigatorKey.currentContext;
  }
}

extension on ConvenientTest {
  Future<void> myCustomCommand() async {
    // Do anything you like... This is just a normal function
    debugPrint('Hello, world!');
  }
}
