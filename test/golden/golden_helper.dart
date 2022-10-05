import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:file/local.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform/platform.dart';

class GoldenTestHelper {
  GoldenTestHelper(this.tester);
  final WidgetTester tester;

  /// Look for MaterialIcons from File System and load them for usage in the test
  Future<void> loadIcons() async {
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
  }

  Future<void> loadVarelaRoundFont() async {
    final font = rootBundle.load('assets/fontsVarelaRound-Regular.ttf');
    final fontLoader = FontLoader('VarelaRound')..addFont(font);
    await fontLoader.load();
  }

  /// Define the screen sizes on which the golden test images will be generated
  Future<void> setSurfaceSize(Size size) async {
    await tester.binding.setSurfaceSize(size);
    tester.binding.window.physicalSizeTestValue = size;
    tester.binding.window.devicePixelRatioTestValue = 1.0;
  }

  /// Precache images for usage in tests (not used in this example)
  Future<void> precacheImages() async {
    final finder = find.byType(Image);
    final matches = finder.evaluate();
    if (matches.isNotEmpty) {
      await tester.runAsync(() async {
        for (var match in matches) {
          final image = match.widget as Image;
          await precacheImage(image.image, match);
        }
      });
    }
    await tester.pumpAndSettle();
  }
}
