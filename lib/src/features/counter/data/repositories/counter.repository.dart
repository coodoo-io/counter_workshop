import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/converters/counter_response.converter.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'dart:developer';

import 'package:counter_workshop/src/features/counter/domain/repository/counter.repository_interface.dart';

class CounterRepository implements CounterRepositoryInterface {
  CounterRepository({required this.counterApi}) {
    // prefill repository Counter from API
    getCounterList();
  }

  final CounterApi counterApi;

  @override
  Future<List<CounterModel>> getCounterList() async {
    log('retriving counter list');
    final List<CounterResponseDto> response = await counterApi.fetchAll();

    // map result to model
    return response.map((c) => CounterResponseConverter().toModel(c)).toList();
  }

  @override
  Future<CounterModel> getCounter({required String id}) async {
    final CounterResponseDto response = await counterApi.fetchCounter(id);

    // map result to model
    return CounterResponseConverter().toModel(response);
  }

  @override
  Future<void> updateCounter({required CounterModel counterModel}) async {
    log('updating counter: ${counterModel.id} with value: $counterModel');

    // map model to dto
    final dto = CounterResponseConverter().toDto(counterModel);

    // store model in database
    await counterApi.updateCounter(counterModel.id, dto);
  }

  @override
  Future<void> deleteCounter({required String id}) async {
    log('deleting counter: $id');
    await counterApi.deleteCounter(id);
  }
}
