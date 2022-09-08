import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// Locale app database like SqlLite that providers a [Counter]
class CounterDatabase {
  Future<Counter> fetchCounter(String id) {
    // TODO: implement fetchCounter

    // 1. Connect to DB
    // 2. SELECT data into CounterEntity
    // 3. Translate the CounterEntity to CounterModel and return it
    throw UnimplementedError();
  }
}
