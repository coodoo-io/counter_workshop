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
  // final sizeVariant = ValueVariant<Size>({
  //   Size(300, 300),
  //   Size(600, 600),
  //   Size(1000, 600),
  // });

  testWidgets(
    'Golden test',
    (WidgetTester tester) async {
      //GoldenRobot r = GoldenRobot(tester);

      // Set different screen sizes for the image and test
      //final currentSize = sizeVariant.currentValue!;
      //await r.setSurfaceSize(currentSize);

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

// Load Font ###########################################################################################################
      final font = rootBundle.load('assets/fonts/VarelaRound-Regular.ttf');
      final fontLoader = FontLoader('Varela')..addFont(font);
      await fontLoader.load();

// Pump Widget #########################################################################################################
      await tester.pumpWidget(
        App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
      );
      await expectLater(
        find.byType(App),
        matchesGoldenFile('app.png'),
        //matchesGoldenFile('app.png_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png'),
      );
      await tester.pumpAndSettle();
    },
    tags: ['golden'],
    //variant: sizeVariant,
  );
}
