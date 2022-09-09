import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// Remote restful API that providers a [CounterModel]
class CounterFakeApi implements CounterApi {
  final CounterResponseDto _counterDto = CounterResponseDto(
    counterValue: 0,
    sysId: '1',
    createdAt: DateTime.now(),
  );

  @override
  Future<CounterResponseDto> fetchCounter(String id) {
    // simulate a network delay
    return Future.delayed(const Duration(milliseconds: 300), () {
      if (id == '1') {
        // return a dummy counter
        return _counterDto;
      } else {
        // return a exception
        throw CounterNotFoundException();
      }
    });
  }

  @override
  Future<CounterResponseDto> incrementCounter(String id, int amount) {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return CounterResponseDto(
        counterValue: _counterDto.counterValue + amount,
        sysId: '1',
        createdAt: DateTime.now(),
      );
    });
  }
}
