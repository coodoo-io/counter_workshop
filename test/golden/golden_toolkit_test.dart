import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
    'Golden Countergrid Test Golden_Toolkit',
    (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        App(
          counterRepository: CounterRepository(
            counterApi: CounterFakeApi(),
          ),
        ),
      );
      await multiScreenGolden(
        tester,
        'golden_toolkit/counter_grid',
        devices: [Device.phone, Device.tabletLandscape],
      );
    },
    tags: ['golden'],
    // skip: true,
  );
}
