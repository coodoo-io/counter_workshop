import 'package:counter/data/counter/counter.repository.dart';
import 'package:counter/data/counter/data_source/api/counter.api.dart';
import 'package:counter/data/counter/data_source/db/counter.db.dart';
import 'package:counter/presentation/app.dart';
import 'package:flutter/material.dart';

void main() {
  final counterRepository =
      CounterRepository(counterApi: CounterApi(), counterDB: CounterDb());

  runApp(MyApp(counterRepository: counterRepository));
}
