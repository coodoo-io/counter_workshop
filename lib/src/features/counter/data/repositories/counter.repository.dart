import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/datasources/local/counter.db.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/converters/counter_response.converter.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';
import 'dart:developer';

class CounterRepository {
  CounterRepository({required this.counterApi, required this.counterDatabase}) {
    _fetchCounterData();
  }

  final CounterApi counterApi;
  final CounterDatabase counterDatabase;

  /// TODO Move to local storage

  // prefill repository Counter from API
  Future<void> _fetchCounterData() async {
    log('retriving default counter');
    CounterResponseDto counterResponseDto = await counterApi.fetchCounter('1');

    // Map result to Model
    CounterModel _counter =
        CounterResponseConverter().toModel(counterResponseDto);

    // store in database
    counterDatabase.storeCounter(_counter);
  }

  CounterModel getCounter() {
    return counterDatabase.getCounter();
  }

  void updateCounter({required String id, required int value}) async {
    log('update counter id by $value');
    await counterApi.incrementCounter(id, value);
    return;
  }
}
