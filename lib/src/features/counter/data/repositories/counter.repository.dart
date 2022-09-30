import 'dart:async';

import 'package:counter_workshop/src/core/logger/app_logger.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/converters/counter_request.converter.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/converters/counter_response.converter.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';

import 'package:counter_workshop/src/features/counter/domain/repository/counter.repository_interface.dart';

class CounterRepository implements CounterRepositoryInterface {
  const CounterRepository({required this.counterApi});

  final CounterApi counterApi;

  @override
  Future<List<CounterModel>> getCounterList() async {
    appLogger.info('retriving counter list');
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
  Future<CounterModel> createCounter({required CounterModel counterModel}) async {
    appLogger.info('creating new counter with name ${counterModel.name}');

    // map model to dto
    final dto = CounterRequestConverter().toDto(counterModel);

    // store model in database
    final response = await counterApi.createCounter(dto);

    // map dto to model
    return CounterResponseConverter().toModel(response);
  }

  @override
  Future<void> updateCounter({required String id, required CounterModel counterModel}) async {
    appLogger.info('updating counter: $id with value: $counterModel');

    // map model to dto
    final dto = CounterResponseConverter().toDto(counterModel);

    // store model in database
    await counterApi.updateCounter(id, dto);
  }

  @override
  Future<void> deleteCounter({required String id}) async {
    appLogger.info('deleting counter: $id');
    await counterApi.deleteCounter(id);
  }
}
