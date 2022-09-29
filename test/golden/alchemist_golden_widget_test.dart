import 'package:alchemist/alchemist.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';

import 'package:flutter/material.dart';

void main() {
  goldenTest(
    'Alchemist Test',
    fileName: 'dashboard',
    builder: () {
      return GoldenTestScenario(
        name: 'Dashboard',
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
        child: App(counterRepository: CounterRepository(counterApi: CounterFakeApi())),
      );
    },
  );
}
