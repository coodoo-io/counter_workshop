import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// FakeApi that simulates a remote restful API which providers a [CounterModel]
class CounterFakeApi implements CounterApi {
  @override
  Future<CounterResponseDto> fetchCounter(String id) {
    // simulate a network delay
    return Future.delayed(const Duration(milliseconds: 300), () {
      if (id == '1') {
        // return a dummy counter
        return CounterResponseDto(
          counterValue: 0,
          sysId: '1',
          createdAt: DateTime.now(),
        );
      } else {
        // return a exception
        throw CounterNotFoundException();
      }
    });
  }

  @override
  Future<void> updateCounter(String id, int value) {
    return Future.delayed(const Duration(milliseconds: 300), () {
      if (id == '1') {
        return;
      } else {
        // return a exception
        throw CounterNotFoundException();
      }
    });
  }
}
