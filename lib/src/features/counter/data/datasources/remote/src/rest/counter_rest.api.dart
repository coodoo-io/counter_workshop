import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_request.dto.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:http/http.dart' as http;

/// Remote restful API that providers a [CounterModel]
class CounterRestApi implements CounterApi {
  CounterRestApi({required this.client});
  final http.Client client;

  @override
  Future<void> createCounter(CounterRequestDto counterRequestDto) {
    // TODO: implement createCounter
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCounter(String id) {
    // TODO: implement deleteCounter
    throw UnimplementedError();
  }

  @override
  Future<List<CounterResponseDto>> fetchAll() {
    // TODO: implement fetchAll
    throw UnimplementedError();
  }

  @override
  Future<CounterResponseDto> fetchCounter(String id) {
    // TODO: implement fetchCounter
    throw UnimplementedError();
  }

  @override
  Future<void> updateCounter(String id, CounterResponseDto counterResponseDto) {
    // TODO: implement updateCounter
    throw UnimplementedError();
  }
}
