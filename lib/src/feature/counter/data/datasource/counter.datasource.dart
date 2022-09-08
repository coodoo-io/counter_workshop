import 'package:counter_workshop/src/feature/counter/domain/counter.model.dart';

/// The interface for a DataSource that provides access to a single [Counter]
abstract class CounterDataSource {
  /// Fetches a counter with the give id
  ///
  /// If no counter with the given id exits, a [CounterNotFoundException] error is thrown.
  Future<Counter> fetchCounter(String id);
}

/// Error thrown when a [Counter] is not found.
class CounterNotFoundException implements Exception {}
