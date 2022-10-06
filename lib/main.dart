import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:flutter/material.dart';

// Still here because Fluter on macOS does not Support Flavors see [https://github.com/flutter/flutter/issues/64088]
void main() {
  F.appFlavor = Flavor.stage;
  runApp(
    AppStart(),
  );
}
