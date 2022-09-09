import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

class CounterResponseConverter {
  CounterModel toModel(CounterResponseDto counterResponseDto) {
    return CounterModel(
      value: counterResponseDto.counterValue,
      id: counterResponseDto.sysId,
    );
  }

  CounterResponseDto toDto(CounterModel counter) {
    return CounterResponseDto(
      counterValue: counter.value,
      sysId: counter.id,
    );
  }
}
