import 'package:counter_workshop/src/feature/counter/data/datasource/counter.datasource.dart';
import 'package:counter_workshop/src/feature/counter/domain/counter.model.dart';

/// Remote restful API that providers a [Counter]
class CounterAPI implements CounterDataSource {
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
