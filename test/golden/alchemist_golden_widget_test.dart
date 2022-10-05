import 'package:alchemist/alchemist.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';

import 'package:flutter/material.dart';

void main() {
  goldenTest(
    'Countergrid Test alchemist',
    fileName: 'dashboard',
    builder: () {
      return GoldenTestScenario(
        name: 'Dashboard',
        constraints: const BoxConstraints(maxWidth: 375, maxHeight: 667),
        child: App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
      );
    },
    // skip: true,
  );
}
