import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/datasources/local/counter.database.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/converters/counter_response.converter.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';
import 'dart:developer';

class CounterRepository {
  CounterRepository({required this.counterApi, required this.counterDatabase}) {
    // prefill repository Counter from API
    _fetchCounterData();
  }

  final CounterApi counterApi;
  final CounterDatabase counterDatabase;
  final String defaultCounterId = '1'; // TODO: allow multiple counters

  Future<void> _fetchCounterData() async {
    log('retriving default counter');
    CounterResponseDto counterResponseDto = await counterApi.fetchCounter(defaultCounterId);

    // map result to Model
    CounterModel counterModel = CounterResponseConverter().toModel(counterResponseDto);

    // store model in database
    await counterDatabase.storeCounter(counterModel);
  }

  Future<CounterModel> getCounter() async {
    return await counterDatabase.getCounter();
  }

  Future<void> updateCounter({required CounterModel counterModel}) async {
    log('updating counter: ${counterModel.id} with value: $counterModel');

    // store model in database
    await counterDatabase.storeCounter(counterModel);

    // store model in api
    await counterApi.updateCounter(counterModel.id, counterModel.value);
  }
}
