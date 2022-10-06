import 'package:alchemist/alchemist.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_helper.dart';

import 'dart:async';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  const isRunningInCi = bool.fromEnvironment('CI', defaultValue: false);

  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        enabled: !isRunningInCi,
      ),
    ),
    run: testMain,
  );
}

void main() {
  final sizeVariant = ValueVariant<Size>({
    const Size(375, 667),
    const Size(1366, 1024),
  });

  group('CounterGrid Golden Test', () {
    testWidgets(
      'Without package',
      (WidgetTester tester) async {
        GoldenTestHelper testHelper = GoldenTestHelper(tester);
        final currentSize = sizeVariant.currentValue!;
        await testHelper.setSurfaceSize(currentSize);
        await testHelper.loadVarelaRoundFont();
        await testHelper.loadIcons();

        await tester.pumpWidget(
          App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(App),
          matchesGoldenFile(
            'goldens/golden_images/app_dashboard_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png',
          ),
        );
      },
      variant: sizeVariant,
      tags: ['golden'],
      skip: true,
    );

    goldenTest(
      'counter_grid_phone',
      fileName: 'counter_grid_phone',
      builder: () {
        return GoldenTestScenario(
          name: 'phone',
          constraints: const BoxConstraints(maxHeight: 667, maxWidth: 375),
          child: App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
        );
      },
    );
    goldenTest(
      'counter_grid_tablet',
      fileName: 'counter_grid_tablet',
      builder: () {
        return GoldenTestScenario(
          name: 'tablet',
          constraints: const BoxConstraints(maxHeight: 1024, maxWidth: 1366),
          child: App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
        );
      },
    );
  });
}
