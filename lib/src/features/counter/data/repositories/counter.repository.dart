import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/datasources/local/counter.db.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';
import 'dart:developer';

class CounterRepository {
  CounterRepository({required this.counterApi, required this.counterDatabase}) {
    _fetchCounterData();
  }

  final CounterApi counterApi;
  final CounterDatabase counterDatabase;
  Counter _counter = Counter(value: 0);

  // prefill repository Counter from API
  Future<void> _fetchCounterData() async {
    log('retriving default counter');
    _counter = await counterApi.fetchCounter('1');
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
