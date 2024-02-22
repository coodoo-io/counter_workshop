import 'package:counter/data/counter/counter.repository.dart';
import 'package:counter/data/counter/data_source/api/counter.api.dart';
import 'package:counter/data/counter/data_source/db/counter.db.dart';
import 'package:counter/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final counterRepository =
      CounterRepository(counterApi: CounterApi(), counterDB: CounterDb());

  runApp(ProviderScope(child: MyApp(counterRepository: counterRepository)));
}
