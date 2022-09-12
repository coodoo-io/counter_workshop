import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// Locale app database like SqlLite that providers a [CounterModel]
class CounterDatabase {
  CounterModel _counter = CounterModel(value: 0);
  final int databaseDelay = 200;

  Future<CounterModel> getCounter() {
    // Pretend it's a db call
    return Future.delayed(Duration(milliseconds: databaseDelay), () => _counter);
  }

  Future<void> storeCounter(CounterModel counter) {
    _counter = counter;
    if (_counter.value == 10) {
      throw Exception('Database read lock while updating Counter to ${_counter.value}.');
    } else {
      // Pretend it's a db call
      return Future.delayed(Duration(milliseconds: databaseDelay));
    }
  }
}
