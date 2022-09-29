import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:file/local.dart';
import 'package:platform/platform.dart';

void main() {
  final sizeVariant = ValueVariant<Size>({
    const Size(300, 600),
    const Size(600, 600),
    const Size(1000, 1000),
  });
  testWidgets(
    'Golden test',
    (WidgetTester tester) async {
      // Set different Screen Sizes ###########################################################################################
      Size currentSize = sizeVariant.currentValue!;

      await tester.binding.setSurfaceSize(currentSize);
      tester.binding.window.physicalSizeTestValue = currentSize;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      // Load Font #####################################################################################################
      final font = rootBundle.load('assets/fonts/VarelaRound-Regular.ttf');
      final fontLoader = FontLoader('VarelaRound')..addFont(font);
      await fontLoader.load();

      // Load Icons ####################################################################################################
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

      // Pump Widget ###################################################################################################
      await tester.pumpWidget(
        App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(App),
        matchesGoldenFile('golden_test_images/app_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png'),
      );
    },
    variant: sizeVariant,
    tags: ['golden'],
    //skip: true,
  );
}
