import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// Locale app database like SqlLite that providers a [CounterModel]
class CounterDatabase {
  CounterModel _counter = CounterModel(value: 0);

  CounterModel getCounter() {
    return _counter;
  }

  storeCounter(CounterModel counter) {
    _counter = counter;
  }
}
