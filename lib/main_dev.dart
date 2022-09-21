import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';

void main() {
  final CounterRepository counterRepository = CounterRepository(counterApi: CounterFakeApi());
  F.appFlavor = Flavor.dev;
  runApp(
    App(
      counterRepository: counterRepository,
    ),
  );
}
