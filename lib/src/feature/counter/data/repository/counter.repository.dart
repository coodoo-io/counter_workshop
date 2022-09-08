import 'dart:async';

import 'package:counter_workshop/src/feature/counter/data/datasource/counter.datasource.dart';
import 'package:counter_workshop/src/feature/counter/domain/counter.model.dart';
import 'dart:developer';

class CounterRepository {
  CounterRepository({required this.counterDataSource}) {
    _fetchCounterData();
  }

  final CounterDataSource counterDataSource;
  Counter _counter = Counter(value: 0);

  // prefill repository Counter from API
  Future<void> _fetchCounterData() async {
    log('retriving default counter');
    _counter = await counterDataSource.fetchCounter('1');
  }

  Counter getCounter() {
    return _counter;
  }

  void increment({required int amount}) {
    log('incrementing counter ${_counter.value} by $amount');
    _counter.value += amount;
    return;
  }
}
