import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// The interface for a DataSource that provides access to a single [CounterModel]
abstract class CounterApi {
  /// Fetches a counter with the give [id]
  ///
  /// If no counter with the given id exits, a [CounterNotFoundException] error is thrown.
  Future<CounterResponseDto> fetchCounter(String id);

  /// Update the value [value] of a given counter [id]
  ///
  /// If no counter with the given id exits, a [CounterNotFoundException] error is thrown.
  Future<void> updateCounter(String id, int value);
}

/// Error thrown when a [CounterModel] is not found.
class CounterNotFoundException implements Exception {}
