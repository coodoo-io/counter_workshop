import 'package:counter/data/counter/data_source/api/counter.api.dart';
import 'package:counter/data/counter/data_source/db/counter.db.dart';
import 'package:counter/domain/counter/model/counter.entity.dart';

class CounterRepository {
  final CounterApi counterApi;
  final CounterDb counterDB;

  CounterEntity _internalCounter = CounterEntity(value: 0);

  get getCurrentCounter {
    return _internalCounter.value;
  }

  CounterRepository({required this.counterApi, required this.counterDB}) {
    counterApi
        .getInitalValue()
        .then((value) => _internalCounter = CounterEntity(value: value));
  }

  void increment() {
    _internalCounter =
        _internalCounter.copyWith(value: (_internalCounter.value) + 1);
  }
}
