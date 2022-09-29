import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/widgets/counter_grid.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:file/local.dart';
import 'package:platform/platform.dart';

void main() {
  final sizeVariant = ValueVariant<Size>({
    const Size(300, 300),
    const Size(600, 600),
    const Size(1000, 1000),
  });
  testWidgets(
    'Golden test',
    (WidgetTester tester) async {
      // Set different Sizes ###########################################################################################
      Size currentSize = sizeVariant.currentValue!;

      await tester.binding.setSurfaceSize(currentSize);
      tester.binding.window.physicalSizeTestValue = currentSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      // Load Icons ########################################################################################################
      const fs = LocalFileSystem();
      const platform = LocalPlatform();
      final flutterRoot = fs.directory(platform.environment['FLUTTER_ROOT']);

      final iconFont = flutterRoot.childFile(
        fs.path.join(
          'bin',
          'cache',
          'artifacts',
          'material_fonts',
          'MaterialIcons-Regular.otf',
        ),
      );

      final bytes = Future<ByteData>.value(iconFont.readAsBytesSync().buffer.asByteData());
      final iconLoader = FontLoader('MaterialIcons')..addFont(bytes);
      await iconLoader.load();

      // Load Font #####################################################################################################
      final font = rootBundle.load('assets/fonts/VarelaRound-Regular.ttf');
      final fontLoader = FontLoader('Varela')..addFont(font);
      await fontLoader.load();

      // Pump Widget #########################################################################################################
      await tester.pumpWidget(
        App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
      );

      await expectLater(
        find.byType(App),
        //matchesGoldenFile('app.png'),
        matchesGoldenFile('app_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png'),
      );

      await tester.pumpAndSettle();
    },
    variant: sizeVariant,
    tags: ['golden'],
  );
}
