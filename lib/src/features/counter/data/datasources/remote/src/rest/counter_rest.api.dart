import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';
import 'package:http/http.dart' as http;

/// Remote restful API that providers a [CounterModel]
class CounterRestApi implements CounterApi {
  CounterRestApi({required this.client});
  final http.Client client;

  @override
  Future<CounterResponseDto> fetchCounter(String id) {
    // TODO: implement fetchCounter
    throw UnimplementedError();
  }

  @override
  Future<void> updateCounter(String id, int value) {
    // TODO: implement incrementCounter
    throw UnimplementedError();
  }
}
