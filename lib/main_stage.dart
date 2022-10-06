import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  F.appFlavor = Flavor.stage;
  runApp(
    AppStart(),
  );
}
