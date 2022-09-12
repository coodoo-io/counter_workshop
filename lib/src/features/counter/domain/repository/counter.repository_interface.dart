import 'dart:async';

import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';

abstract class CounterRepositoryInterface {
  Future<List<CounterModel>> getCounterList();

  Future<CounterModel> getCounter({required String id});

  Future<CounterModel> createCounter({required CounterModel counterModel});

  Future<void> updateCounter({required String id, required CounterModel counterModel});

  Future<void> deleteCounter({required String id});
}
