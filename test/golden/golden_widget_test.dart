import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_helper.dart';

void main() {
  final sizeVariant = ValueVariant<Size>({
    const Size(375, 667),
    const Size(1366, 1024),
  });
  testWidgets(
    'Golden Countergrid Test Standard',
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
        matchesGoldenFile('golden_images/app_dashboard_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png'),
      );
    },
    variant: sizeVariant,
    tags: ['golden'],
    //skip: true,
  );
}
