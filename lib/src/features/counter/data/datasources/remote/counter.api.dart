import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_request.dto.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';

/// The interface for a DataSource that provides access to a single [CounterModel]
abstract class CounterApi {
  /// Fetches all counters
  Future<List<CounterResponseDto>> fetchAll();

  /// Fetches a counter with the give [id]
  ///
  /// If no counter with the given id exits, a [CounterNotFoundException] error is thrown.
  Future<CounterResponseDto> fetchCounter(String id);

  /// Update the counter [CounterResponseDto] of a given counter [id]
  ///
  /// If no counter with the given id exits, a [CounterNotFoundException] error is thrown.
  Future<void> updateCounter(String id, CounterResponseDto counterResponseDto);

  /// Create a new counter
  Future<void> createCounter(CounterRequestDto counterRequestDto);

  /// Deletes a counter by a given counter [id]
  ///
  /// If no counter with the given id exits, a [CounterNotFoundException] error is thrown.
  Future<void> deleteCounter(String id);
}

/// Error thrown when a [CounterModel] is not found.
class CounterNotFoundException implements Exception {}
