import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';
import 'package:http/http.dart' as http;

/// Remote restful API that providers a [Counter]
class CounterRestApi implements CounterApi {
  CounterRestApi({required this.client});
  final http.Client client;

  @override
  Future<Counter> fetchCounter(String id) {
    // simulate a network delay
    return Future.delayed(const Duration(milliseconds: 300), () {
      if (id == '1') {
        // return a dummy counter
        return Counter(value: 0);
      } else {
        // return a exception
        throw CounterNotFoundException();
      }
    });
  }
}
