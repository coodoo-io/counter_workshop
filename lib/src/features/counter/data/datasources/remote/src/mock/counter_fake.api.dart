import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_request.dto.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';

/// FakeApi that simulates a remote restful API which providers a [CounterModel]
class CounterFakeApi implements CounterApi {
  final int fakeApiDelay = 300;
  final List<CounterResponseDto> _counterList = [
    CounterResponseDto(
      counterValue: 1,
      sysId: '1',
      name: 'Kaffee',
      createdAt: DateTime.now(),
    ),
    CounterResponseDto(
      counterValue: 4,
      sysId: '2',
      name: 'Wassergläser',
      createdAt: DateTime.now(),
    ),
    CounterResponseDto(
      counterValue: 21,
      sysId: '3',
      name: 'Überstunden',
      createdAt: DateTime.now(),
    ),
    CounterResponseDto(
      counterValue: 2,
      sysId: '4',
      name: 'Kekse',
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Future<List<CounterResponseDto>> fetchAll() {
    return Future.delayed(Duration(milliseconds: fakeApiDelay), () => _counterList);
  }

  @override
  Future<CounterResponseDto> fetchCounter(String id) {
    // simulate a network delay
    return Future.delayed(
      Duration(milliseconds: fakeApiDelay),
      () => _counterList.firstWhere((c) => c.sysId == id, orElse: () => throw CounterNotFoundException()),
    );
  }

  @override
  Future<void> updateCounter(String id, CounterResponseDto counterResponseDto) {
    final dbIndex = _counterList.indexWhere((c) => c.sysId == id);
    if (dbIndex != -1) {
      return Future.delayed(Duration(milliseconds: fakeApiDelay), () {
        _counterList[dbIndex] = counterResponseDto;
      });
    }
    return Future.value();
  }

  @override
  Future<CounterResponseDto> createCounter(CounterRequestDto counterRequestDto) {
    var dto = CounterResponseDto(
      counterValue: counterRequestDto.counterValue,
      name: counterRequestDto.name,
      sysId: (_counterList.length + 1).toString(),
      createdAt: counterRequestDto.createdAt,
      updatedAt: counterRequestDto.updatedAt,
      color: counterRequestDto.color,
      goalValue: counterRequestDto.goalValue,
      startValue: counterRequestDto.startValue,
      stepSize: counterRequestDto.stepSize,
    );

    _counterList.add(dto);
    return Future.delayed(Duration(milliseconds: fakeApiDelay), () {
      return dto;
    });
  }

  @override
  Future<void> deleteCounter(String id) async {
    _counterList.removeWhere((c) => c.sysId == id);
  }
}
