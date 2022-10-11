import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_dev/src/support/get_it.dart';
import 'package:counter_workshop/main.dart' as main_app;
import 'package:counter_workshop/src/core/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group('add überstunden', () {
      tTestWidgets('Open Überstunden', (t) async {
        await find.text('Überstunden').should(findsOneWidget);
        await find.text('Überstunden').tap();
        await t.get('counter_text_Überstunden').should(findsOneWidget);
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
        await find.text('German').should(findsOneWidget);
        await find.text('German').tap();
        await find.text('Deutsch').should(findsOneWidget);
        await find.text('German').should(findsNothing);
      });
    });

    group('open add dialog', () {
      tTestWidgets('should open page', (t) async {
        await t.goRouteCommand('counters');
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
    return router.routerDelegate.navigatorKey.currentContext!;
  }
}

extension on ConvenientTest {
  Future<void> myCustomCommand() async {
    // Do anything you like... This is just a normal function
    debugPrint('Hello, world!');
  }

  Future<void> goRouteCommand(name) async {
    await pump();
    // If await, will wait forever until the page is popped - surely we do not want that
    // ignore: use_build_context_synchronously
    myGetIt.get<ConvenientTestSlot>().getNavContext(this)!.goNamed(name);
    await pumpAndSettle();
  }
}
