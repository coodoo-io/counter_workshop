import 'package:counter_workshop/src/feature/counter/data/datasource/counter.datasource.dart';
import 'package:counter_workshop/src/feature/counter/domain/counter.model.dart';

/// Locale app database like SqlLite that providers a [Counter]
class CounterDBDataSource implements CounterDataSource {
  @override
  Future<Counter> fetchCounter(String id) {
    // TODO: implement fetchCounter

    // 1. Connect to DB
    // 2. SELECT data into CounterEntity
    // 3. Translate the CounterEntity to CounterModel and return it
    throw UnimplementedError();
  }
}
