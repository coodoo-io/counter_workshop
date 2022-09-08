import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/feature/counter/data/datasource/remote/counter.api.dart';
import 'package:counter_workshop/src/feature/counter/data/repository/counter.repository.dart';
import 'package:flutter/material.dart';

void main() {
  final CounterRepository counterRepository = CounterRepository(counterDataSource: CounterAPI());
  runApp(
    App(
      counterRepository: counterRepository,
    ),
  );
}
